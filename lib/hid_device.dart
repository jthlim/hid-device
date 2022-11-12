import 'package:hid_device_platform_interface/hid_device_platform_interface.dart';

export 'package:hid_device_platform_interface/types.dart';

class Hid {
  factory Hid() {
    return const Hid._();
  }

  const Hid._();

  static HidDevicePlatform get _platform {
    return HidDevicePlatform.instance;
  }

  Future<bool> isSupported() {
    return _platform.isSupported();
  }

  Future<List<HIDDevice>> getDevices() => _platform.getDevices();

  /// Pair a device
  Future<List<HIDDevice>> requestDevice({
    List<HIDDeviceFilter> filters = const [],
    List<HIDDeviceFilter>? excludeFilters = null,
  }) {
    return _platform.requestDevice(
      filters: filters,
      excludeFilters: excludeFilters,
    );
  }

  @override
  Object? addDisconnectListener(void Function(HIDConnectionEvent) listener) =>
      _platform.addDisconnectListener(listener);

  @override
  void removeDisconnectListener(Object? subscription) =>
      _platform.removeDisconnectListener(subscription);
}
