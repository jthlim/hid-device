import 'dart:async';
import 'package:flutter/services.dart';
import 'hid_device_platform_interface.dart';

const MethodChannel _channel = MethodChannel('au.lim/hid_device');

class MethodChannelHidDevice extends HidDevicePlatform {
  @override
  Future<bool> isSupported() {
    return _channel
        .invokeMethod<bool>(
          'isSupported',
        )
        .then((bool? value) => value ?? false);
  }
}
