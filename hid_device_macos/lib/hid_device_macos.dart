import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hid_device_platform_interface/hid_device_platform_interface.dart';

const MethodChannel _channel = MethodChannel('au.lim/hid_device_macos');

class HidDeviceMacOS extends HidDevicePlatform {
  static void registerWith() {
    HidDevicePlatform.instance = HidDeviceMacOS();
  }

  @override
  Future<bool> isSupported() {
    return _channel
        .invokeMethod<bool>(
          'isSupported',
        )
        .then((bool? value) => value ?? false);
  }

  @override
  Future<List<HIDDevice>> requestDevice({
    List<HIDDeviceFilter> filters = const [],
    List<HIDDeviceFilter>? excludeFilters,
  }) {
    return _channel.invokeMethod<bool>(
      'requestDevice',
      <String, Object?>{
        'filters': filters.toString(),
        'excludeFilters': excludeFilters?.toString(),
      },
    ).then((_) => []);
  }
}
