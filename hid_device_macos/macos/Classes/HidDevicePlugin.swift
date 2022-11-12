import FlutterMacOS
import Foundation

public protocol SystemHidDeviceHandler {
  func isSupported() -> Bool
}

extension NSWorkspace: SystemHidDeviceHandler {}

public class HidDevicePlugin: NSObject, FlutterPlugin {

  private var workspace: SystemHidDeviceHandler

  public init(_ workspace: SystemHidDeviceHandler = NSWorkspace.shared) {
    self.workspace = workspace
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "au.lim/hid_device_macos",
      binaryMessenger: registrar.messenger)
    let instance = HidDevicePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isSupported":
      return true;

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

