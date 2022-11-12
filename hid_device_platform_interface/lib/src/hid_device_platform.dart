import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../method_channel_hid_device.dart';
import '../types.dart';

abstract class HidDevicePlatform extends PlatformInterface {
  HidDevicePlatform() : super(token: _token);

  static final Object _token = Object();

  static HidDevicePlatform _instance = MethodChannelHidDevice();
  static HidDevicePlatform get instance => _instance;

  static set instance(HidDevicePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<bool> isSupported() {
    throw UnimplementedError('isSupported() has not been implemented.');
  }

  Future<List<HIDDevice>> getDevices() {
    throw UnimplementedError('getDevices() has not been implemented.');
  }

  Future<List<HIDDevice>> requestDevice({
    List<HIDDeviceFilter> filters = const [],
    List<HIDDeviceFilter>? excludeFilters = null,
  }) {
    throw UnimplementedError('requestDevice() has not been implemented.');
  }

  Object? addDisconnectListener(void Function(HIDConnectionEvent) listener) {
    throw UnimplementedError(
        'addDisconnectListener() has not been implemented.');
  }

  void removeDisconnectListener(Object? subscription) {
    throw UnimplementedError(
        'removeDisconnectListener() has not been implemented.');
  }
}
