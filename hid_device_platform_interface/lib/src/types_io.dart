import 'dart:typed_data';

class HIDDeviceFilter {
  HIDDeviceFilter({
    this.vendorId,
    this.productId,
    this.usage,
    this.usagePage,
  });

  final int? vendorId;
  final int? productId;
  final int? usage;
  final int? usagePage;
}

abstract class HIDDevice {
  bool get opened;
  int get vendorId;
  int get productId;
  String get productName;
  Iterable<HIDCollectionInfo> get collections;

  Future<void> open();
  Future<void> close();
  Future<void> forget();

  Object addInputReportListener(void Function(HIDInputReportEvent) listener);
  void removeInputReportListener(Object subscription);

  Future<void> sendReportString(String s);
}

abstract class HIDInputReportEvent {
  HIDDevice get device;
  int get reportId;
  ByteData get data;
}

abstract class HIDConnectionEvent {
  HIDDevice get device;
}

abstract class Hid {
  Future<Iterable<HIDDevice>> getDevices();

  Future<Iterable<HIDDevice>> requestDevice(HIDDeviceRequestOptions options);

  Object addDisconnectListener(void Function(HIDConnectionEvent) listener);
  void removeDisconnectListener(Object subscription);
}

class HIDDeviceRequestOptions {
  HIDDeviceRequestOptions({
    required this.filters,
    this.exclusionFilters,
  });

  final List<HIDDeviceFilter> filters;
  final List<HIDDeviceFilter>? exclusionFilters;
}

abstract class HIDCollectionInfo {
  int get usagePage;
  int get usage;
  int get type;
}
