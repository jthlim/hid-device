import 'dart:async';
import 'dart:html' as html;
import 'dart:js_util' as js_util;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hid_device_platform_interface/hid_device_platform_interface.dart';

class HidDevicePlugin extends HidDevicePlatform {
  HidDevicePlugin() : _hid = js_util.getProperty(html.window.navigator, 'hid');

  final Hid? _hid;

  static void registerWith(Registrar registrar) {
    HidDevicePlatform.instance = HidDevicePlugin();
  }

  @override
  Future<bool> isSupported() async {
    return _hid != null;
  }

  @override
  Future<List<HIDDevice>> getDevices() async {
    final hid = _hid;
    if (hid == null) {
      return [];
    }

    final result = await hid.getDevices();
    return result.toList();
  }

  @override
  Future<List<HIDDevice>> requestDevice({
    List<HIDDeviceFilter> filters = const [],
    List<HIDDeviceFilter>? excludeFilters = null,
  }) async {
    final hid = _hid;
    if (hid == null) {
      return [];
    }

    // JS has distinct representations for null vs non-null, so need to
    // build these cases separately.
    final options = excludeFilters == null
        ? HIDDeviceRequestOptions(
            filters: filters,
          )
        : HIDDeviceRequestOptions(
            filters: filters,
            exclusionFilters: excludeFilters,
          );
    final result = await hid.requestDevice(options);

    return result.toList();
  }

  @override
  Object? addDisconnectListener(void Function(HIDConnectionEvent) listener) =>
      _hid?.addDisconnectListener(listener);

  @override
  void removeDisconnectListener(Object? subscription) =>
      _hid?.removeDisconnectListener(subscription);
}
