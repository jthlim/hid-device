/// WebHID API
///
/// https://wicg.github.io/webhid/

// ignore_for_file: unused_import

@JS('window')
@staticInterop
library webhid;

import 'dart:convert';
import 'dart:typed_data';

import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;

/// The interface represents an event which takes place in the DOM.
///  An event can be triggered by the user action e.g. clicking the
/// mouse button or tapping keyboard, or generated by APIs to
/// represent the progress of an asynchronous task. It can also be
/// triggered programmatically, such as by calling the
/// [HTMLElement.click()] method of an element, or by defining the
/// event, then sending it to a specified target using
/// [EventTarget.dispatchEvent()].
///  There are many types of events, some of which use other
/// interfaces based on the main interface. itself contains the
/// properties and methods which are common to all events.
///  Many DOM elements can be set up to accept (or "listen" for)
/// these events, and execute code in response to process (or
/// "handle") them. Event-handlers are usually connected (or
/// "attached") to various HTML elements (such as [<button>],
/// [<div>], [<span>], etc.) using [EventTarget.addEventListener()],
/// and this generally replaces using the old HTML event handler
/// attributes. Further, when properly added, such handlers can also
/// be disconnected if needed using [removeEventListener()].
///
///   Note: One element can have several such handlers, even for the
/// exact same event—particularly if separate, independent code
/// modules attach them, each for its own independent purposes. (For
/// example, a webpage with an advertising-module and
/// statistics-module both monitoring video-watching.)
///
///  When there are many nested elements, each with its own
/// handler(s), event processing can become very
/// complicated—especially where a parent element receives the very
/// same event as its child elements because "spatially" they overlap
/// so the event technically occurs in both, and the processing order
/// of such events depends on the Event bubbling and capture settings
/// of each handler triggered.
@JS()
@staticInterop
class Event {
  external factory Event(String type, [EventInit? eventInitDict]);
  @JS('NONE')
  external static int get none;

  @JS('CAPTURING_PHASE')
  external static int get capturingPhase;

  @JS('AT_TARGET')
  external static int get atTarget;

  @JS('BUBBLING_PHASE')
  external static int get bubblingPhase;
}

extension PropsEvent on Event {
  String get type => js_util.getProperty(this, 'type');
  EventTarget? get target => js_util.getProperty(this, 'target');
  EventTarget? get srcElement => js_util.getProperty(this, 'srcElement');
  EventTarget? get currentTarget => js_util.getProperty(this, 'currentTarget');
  Iterable<EventTarget> composedPath() =>
      js_util.callMethod(this, 'composedPath', []);

  int get eventPhase => js_util.getProperty(this, 'eventPhase');
  void stopPropagation() => js_util.callMethod(this, 'stopPropagation', []);

  bool get cancelBubble => js_util.getProperty(this, 'cancelBubble');
  set cancelBubble(bool newValue) {
    js_util.setProperty(this, 'cancelBubble', newValue);
  }

  void stopImmediatePropagation() =>
      js_util.callMethod(this, 'stopImmediatePropagation', []);

  bool get bubbles => js_util.getProperty(this, 'bubbles');
  bool get cancelable => js_util.getProperty(this, 'cancelable');
  dynamic get returnValue => js_util.getProperty(this, 'returnValue');
  set returnValue(dynamic newValue) {
    js_util.setProperty(this, 'returnValue', newValue);
  }

  void preventDefault() => js_util.callMethod(this, 'preventDefault', []);

  bool get defaultPrevented => js_util.getProperty(this, 'defaultPrevented');
  bool get composed => js_util.getProperty(this, 'composed');
  bool get isTrusted => js_util.getProperty(this, 'isTrusted');
  double get timeStamp => js_util.getProperty(this, 'timeStamp');
  void initEvent(String type,
          [bool? bubbles = false, bool? cancelable = false]) =>
      js_util.callMethod(this, 'initEvent', [type, bubbles, cancelable]);
}

@anonymous
@JS()
@staticInterop
class EventInit {
  external factory EventInit(
      {bool? bubbles = false,
      bool? cancelable = false,
      bool? composed = false});
}

///
///   The interface is implemented by objects that can receive events
/// and may have listeners for them.
///   In other words, any target of events implements the three
/// methods associated with this interface.
///   [Element], and its children, as well as [Document] and
/// [Window], are the most common event targets,
///  but other objects can be event targets, too.
///   For example [XMLHttpRequest], [AudioNode], and [AudioContext]
/// are also event targets.
///
///  Many event targets (including elements, documents, and windows)
/// also support setting event handlers via [onevent] properties and
/// attributes.
@JS()
@staticInterop
class EventTarget {
  external factory EventTarget();
}

typedef EventListener = Function(Event event);

extension PropsEventTarget on EventTarget {
  void addEventListener(String type, EventListener? callback,
          [dynamic options]) =>
      js_util.callMethod(this, 'addEventListener',
          [type, callback == null ? null : allowInterop(callback), options]);

  void removeEventListener(String type, EventListener? callback,
          [dynamic options]) =>
      js_util.callMethod(this, 'removeEventListener',
          [type, callback == null ? null : allowInterop(callback), options]);

  bool dispatchEvent(Event event) =>
      js_util.callMethod(this, 'dispatchEvent', [event]);
}

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface provides methods for connecting to HID devices,
/// listing attached HID devices and event handlers for connected HID
/// devices.
///
///
///
///    EventTarget
///
///
///
///
///
///    HID
///
///
@JS('HID')
@staticInterop
class Hid implements EventTarget {
  external factory Hid();
}

extension PropsHid on Hid {
  EventHandlerNonNull? get onconnect => js_util.getProperty(this, 'onconnect');
  set onconnect(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onconnect', newValue);
  }

  EventHandlerNonNull? get ondisconnect =>
      js_util.getProperty(this, 'ondisconnect');
  set ondisconnect(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'ondisconnect', newValue);
  }

  Future<Iterable<HIDDevice>> getDevices() {
    final promise = js_util.callMethod(this, 'getDevices', []);
    return js_util.promiseToFuture(promise).then((value) {
      return (value as List).map((e) => HIDDevice(e as _HIDDevice));
    });
  }

  Future<Iterable<HIDDevice>> requestDevice(HIDDeviceRequestOptions options) {
    final promise = js_util.callMethod(this, 'requestDevice', [options]);
    return js_util.promiseToFuture(promise).then((value) {
      return (value as List).map((e) => HIDDevice(e as _HIDDevice));
    });
  }

  Object addDisconnectListener(void Function(HIDConnectionEvent) listener) {
    final result = allowInterop(listener);
    js_util.callMethod(
      this,
      'addEventListener',
      ['disconnect', result],
    );
    return result;
  }

  void removeDisconnectListener(Object? subscription) {
    js_util.callMethod(
      this,
      'removeEventListener',
      ['disconnect', subscription],
    );
  }
}

@anonymous
@JS()
@staticInterop
class HIDDeviceRequestOptions {
  external factory HIDDeviceRequestOptions(
      {Iterable<HIDDeviceFilter> filters,
      Iterable<HIDDeviceFilter> exclusionFilters});
}

@anonymous
@JS()
@staticInterop
class HIDDeviceFilter {
  external factory HIDDeviceFilter(
      {int vendorId, int productId, int usagePage, int usage});
}

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface of the [WebHID API] represents a HID Device. It
/// provides properties for accessing information about the device,
/// methods for opening and closing the connection, and the sending
/// and receiving of reports.
///
///
///
///    EventTarget
///
///
///
///
///
///    HIDDevice
///
///
@JS('HIDDevice')
@staticInterop
class _HIDDevice implements EventTarget {
  external factory _HIDDevice();
}

class HIDDevice {
  HIDDevice(this._device);

  _HIDDevice _device;

  bool get opened => _device.opened;
  int get vendorId => _device.vendorId;
  int get productId => _device.productId;
  String get productName => _device.productName;
  Iterable<HIDCollectionInfo> get collections => _device.collections;

  Future<void> open() => _device.open();
  Future<void> close() => _device.close();
  Future<void> forget() => _device.forget();

  Object addInputReportListener(void Function(HIDInputReportEvent) listener) {
    Object result = allowInterop(listener);
    js_util.callMethod(
      _device,
      'addEventListener',
      ['inputreport', result],
    );
    return result;
  }

  void removeInputReportListener(Object subscription) {
    js_util.callMethod(
      _device,
      'removeEventListener',
      ['inputreport', subscription],
    );
  }

  Future<void> sendReportString(String s) {
    final data = utf8.encode(s);
    return _device.sendReport(0, Uint8List.fromList(data));
  }

  @override
  bool operator ==(Object other) {
    return other is HIDDevice && _device == other._device;
  }
}

typedef EventHandlerNonNull<T extends Event> = Function(T event);

extension PropsHIDDevice on _HIDDevice {
  EventHandlerNonNull? get oninputreport =>
      js_util.getProperty(this, 'oninputreport');
  set oninputreport(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'oninputreport', newValue);
  }

  bool get opened => js_util.getProperty(this, 'opened');
  int get vendorId => js_util.getProperty(this, 'vendorId');
  int get productId => js_util.getProperty(this, 'productId');
  String get productName => js_util.getProperty(this, 'productName');
  Iterable<HIDCollectionInfo> get collections =>
      js_util.getProperty(this, 'collections');
  Future<void> open() =>
      js_util.promiseToFuture(js_util.callMethod(this, 'open', []));

  Future<void> close() =>
      js_util.promiseToFuture(js_util.callMethod(this, 'close', []));

  Future<void> forget() =>
      js_util.promiseToFuture(js_util.callMethod(this, 'forget', []));

  Future<void> sendReport(int reportId, dynamic data) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'sendReport', [reportId, data]));

  Future<void> sendFeatureReport(int reportId, dynamic data) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'sendFeatureReport', [reportId, data]));

  Future<ByteData> receiveFeatureReport(int reportId) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'receiveFeatureReport', [reportId]));
}

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface of the [WebHID API] represents HID connection
/// events, and is the event type passed to [HID.onconnect] and
/// [HID.ondisconnect] when an input report is received.
///
///
///
///    Event
///
///
///
///
///
///    HIDConnectionEvent
///
///
@JS()
@staticInterop
class HIDConnectionEvent implements Event {
  external factory HIDConnectionEvent(
      String type, HIDConnectionEventInit eventInitDict);
}

extension PropsHIDConnectionEvent on HIDConnectionEvent {
  HIDDevice get device => HIDDevice(js_util.getProperty(this, 'device'));
}

@anonymous
@JS()
@staticInterop
class HIDConnectionEventInit extends EventInit {
  external factory HIDConnectionEventInit({required _HIDDevice device});
}

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface of the [WebHID API] is passed to
/// [HIDDevice.oninputreport] when an input report is received from
/// any associated HID device.
///
///
///
///    Event
///
///
///
///
///
///    HIDInputReportEvent
///
///
@JS()
@staticInterop
class HIDInputReportEvent implements Event {
  external factory HIDInputReportEvent(
      String type, HIDInputReportEventInit eventInitDict);
}

extension PropsHIDInputReportEvent on HIDInputReportEvent {
  HIDDevice get device => HIDDevice(js_util.getProperty(this, 'device'));
  int get reportId => js_util.getProperty(this, 'reportId');
  ByteData get data => js_util.getProperty(this, 'data');
}

@anonymous
@JS()
@staticInterop
class HIDInputReportEventInit extends EventInit {
  external factory HIDInputReportEventInit(
      {required _HIDDevice device,
      required int reportId,
      required ByteData data});
}

@anonymous
@JS()
@staticInterop
class HIDCollectionInfo {
  external factory HIDCollectionInfo(
      {required int usagePage,
      required int usage,
      required int type,
      required Iterable<HIDCollectionInfo> children,
      required Iterable<HIDReportInfo> inputReports,
      required Iterable<HIDReportInfo> outputReports,
      required Iterable<HIDReportInfo> featureReports});
}

extension PropsHIDCollectionInfo on HIDCollectionInfo {
  int get usagePage => js_util.getProperty(this, 'usagePage');
  set usagePage(int newValue) {
    js_util.setProperty(this, 'usagePage', newValue);
  }

  int get usage => js_util.getProperty(this, 'usage');
  set usage(int newValue) {
    js_util.setProperty(this, 'usage', newValue);
  }

  int get type => js_util.getProperty(this, 'type');
  set type(int newValue) {
    js_util.setProperty(this, 'type', newValue);
  }

  Iterable<HIDCollectionInfo> get children =>
      js_util.getProperty(this, 'children');
  set children(Iterable<HIDCollectionInfo> newValue) {
    js_util.setProperty(this, 'children', newValue);
  }

  Iterable<HIDReportInfo> get inputReports =>
      js_util.getProperty(this, 'inputReports');
  set inputReports(Iterable<HIDReportInfo> newValue) {
    js_util.setProperty(this, 'inputReports', newValue);
  }

  Iterable<HIDReportInfo> get outputReports =>
      js_util.getProperty(this, 'outputReports');
  set outputReports(Iterable<HIDReportInfo> newValue) {
    js_util.setProperty(this, 'outputReports', newValue);
  }

  Iterable<HIDReportInfo> get featureReports =>
      js_util.getProperty(this, 'featureReports');
  set featureReports(Iterable<HIDReportInfo> newValue) {
    js_util.setProperty(this, 'featureReports', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class HIDReportInfo {
  external factory HIDReportInfo(
      {required int reportId, required Iterable<HIDReportItem> items});
}

extension PropsHIDReportInfo on HIDReportInfo {
  int get reportId => js_util.getProperty(this, 'reportId');
  set reportId(int newValue) {
    js_util.setProperty(this, 'reportId', newValue);
  }

  Iterable<HIDReportItem> get items => js_util.getProperty(this, 'items');
  set items(Iterable<HIDReportItem> newValue) {
    js_util.setProperty(this, 'items', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class HIDReportItem {
  external factory HIDReportItem._(
      {required bool isAbsolute,
      required bool isArray,
      required bool isBufferedBytes,
      required bool isConstant,
      required bool isLinear,
      required bool isRange,
      required bool isVolatile,
      required bool hasNull,
      required bool hasPreferredState,
      required bool wrap,
      required Iterable<int> usages,
      required int usageMinimum,
      required int usageMaximum,
      required int reportSize,
      required int reportCount,
      required int unitExponent,
      required String unitSystem,
      required int unitFactorLengthExponent,
      required int unitFactorMassExponent,
      required int unitFactorTimeExponent,
      required int unitFactorTemperatureExponent,
      required int unitFactorCurrentExponent,
      required int unitFactorLuminousIntensityExponent,
      required int logicalMinimum,
      required int logicalMaximum,
      required int physicalMinimum,
      required int physicalMaximum,
      required Iterable<String> strings});

  factory HIDReportItem(
          {required bool isAbsolute,
          required bool isArray,
          required bool isBufferedBytes,
          required bool isConstant,
          required bool isLinear,
          required bool isRange,
          required bool isVolatile,
          required bool hasNull,
          required bool hasPreferredState,
          required bool wrap,
          required Iterable<int> usages,
          required int usageMinimum,
          required int usageMaximum,
          required int reportSize,
          required int reportCount,
          required int unitExponent,
          required HIDUnitSystem unitSystem,
          required int unitFactorLengthExponent,
          required int unitFactorMassExponent,
          required int unitFactorTimeExponent,
          required int unitFactorTemperatureExponent,
          required int unitFactorCurrentExponent,
          required int unitFactorLuminousIntensityExponent,
          required int logicalMinimum,
          required int logicalMaximum,
          required int physicalMinimum,
          required int physicalMaximum,
          required Iterable<String> strings}) =>
      HIDReportItem._(
          isAbsolute: isAbsolute,
          isArray: isArray,
          isBufferedBytes: isBufferedBytes,
          isConstant: isConstant,
          isLinear: isLinear,
          isRange: isRange,
          isVolatile: isVolatile,
          hasNull: hasNull,
          hasPreferredState: hasPreferredState,
          wrap: wrap,
          usages: usages,
          usageMinimum: usageMinimum,
          usageMaximum: usageMaximum,
          reportSize: reportSize,
          reportCount: reportCount,
          unitExponent: unitExponent,
          unitSystem: unitSystem.name,
          unitFactorLengthExponent: unitFactorLengthExponent,
          unitFactorMassExponent: unitFactorMassExponent,
          unitFactorTimeExponent: unitFactorTimeExponent,
          unitFactorTemperatureExponent: unitFactorTemperatureExponent,
          unitFactorCurrentExponent: unitFactorCurrentExponent,
          unitFactorLuminousIntensityExponent:
              unitFactorLuminousIntensityExponent,
          logicalMinimum: logicalMinimum,
          logicalMaximum: logicalMaximum,
          physicalMinimum: physicalMinimum,
          physicalMaximum: physicalMaximum,
          strings: strings);
}

extension PropsHIDReportItem on HIDReportItem {
  bool get isAbsolute => js_util.getProperty(this, 'isAbsolute');
  set isAbsolute(bool newValue) {
    js_util.setProperty(this, 'isAbsolute', newValue);
  }

  bool get isArray => js_util.getProperty(this, 'isArray');
  set isArray(bool newValue) {
    js_util.setProperty(this, 'isArray', newValue);
  }

  bool get isBufferedBytes => js_util.getProperty(this, 'isBufferedBytes');
  set isBufferedBytes(bool newValue) {
    js_util.setProperty(this, 'isBufferedBytes', newValue);
  }

  bool get isConstant => js_util.getProperty(this, 'isConstant');
  set isConstant(bool newValue) {
    js_util.setProperty(this, 'isConstant', newValue);
  }

  bool get isLinear => js_util.getProperty(this, 'isLinear');
  set isLinear(bool newValue) {
    js_util.setProperty(this, 'isLinear', newValue);
  }

  bool get isRange => js_util.getProperty(this, 'isRange');
  set isRange(bool newValue) {
    js_util.setProperty(this, 'isRange', newValue);
  }

  bool get isVolatile => js_util.getProperty(this, 'isVolatile');
  set isVolatile(bool newValue) {
    js_util.setProperty(this, 'isVolatile', newValue);
  }

  bool get hasNull => js_util.getProperty(this, 'hasNull');
  set hasNull(bool newValue) {
    js_util.setProperty(this, 'hasNull', newValue);
  }

  bool get hasPreferredState => js_util.getProperty(this, 'hasPreferredState');
  set hasPreferredState(bool newValue) {
    js_util.setProperty(this, 'hasPreferredState', newValue);
  }

  bool get wrap => js_util.getProperty(this, 'wrap');
  set wrap(bool newValue) {
    js_util.setProperty(this, 'wrap', newValue);
  }

  Iterable<int> get usages => js_util.getProperty(this, 'usages');
  set usages(Iterable<int> newValue) {
    js_util.setProperty(this, 'usages', newValue);
  }

  int get usageMinimum => js_util.getProperty(this, 'usageMinimum');
  set usageMinimum(int newValue) {
    js_util.setProperty(this, 'usageMinimum', newValue);
  }

  int get usageMaximum => js_util.getProperty(this, 'usageMaximum');
  set usageMaximum(int newValue) {
    js_util.setProperty(this, 'usageMaximum', newValue);
  }

  int get reportSize => js_util.getProperty(this, 'reportSize');
  set reportSize(int newValue) {
    js_util.setProperty(this, 'reportSize', newValue);
  }

  int get reportCount => js_util.getProperty(this, 'reportCount');
  set reportCount(int newValue) {
    js_util.setProperty(this, 'reportCount', newValue);
  }

  int get unitExponent => js_util.getProperty(this, 'unitExponent');
  set unitExponent(int newValue) {
    js_util.setProperty(this, 'unitExponent', newValue);
  }

  HIDUnitSystem get unitSystem =>
      HIDUnitSystem.values.byName(js_util.getProperty(this, 'unitSystem'));
  set unitSystem(HIDUnitSystem newValue) {
    js_util.setProperty(this, 'unitSystem', newValue.name);
  }

  int get unitFactorLengthExponent =>
      js_util.getProperty(this, 'unitFactorLengthExponent');
  set unitFactorLengthExponent(int newValue) {
    js_util.setProperty(this, 'unitFactorLengthExponent', newValue);
  }

  int get unitFactorMassExponent =>
      js_util.getProperty(this, 'unitFactorMassExponent');
  set unitFactorMassExponent(int newValue) {
    js_util.setProperty(this, 'unitFactorMassExponent', newValue);
  }

  int get unitFactorTimeExponent =>
      js_util.getProperty(this, 'unitFactorTimeExponent');
  set unitFactorTimeExponent(int newValue) {
    js_util.setProperty(this, 'unitFactorTimeExponent', newValue);
  }

  int get unitFactorTemperatureExponent =>
      js_util.getProperty(this, 'unitFactorTemperatureExponent');
  set unitFactorTemperatureExponent(int newValue) {
    js_util.setProperty(this, 'unitFactorTemperatureExponent', newValue);
  }

  int get unitFactorCurrentExponent =>
      js_util.getProperty(this, 'unitFactorCurrentExponent');
  set unitFactorCurrentExponent(int newValue) {
    js_util.setProperty(this, 'unitFactorCurrentExponent', newValue);
  }

  int get unitFactorLuminousIntensityExponent =>
      js_util.getProperty(this, 'unitFactorLuminousIntensityExponent');
  set unitFactorLuminousIntensityExponent(int newValue) {
    js_util.setProperty(this, 'unitFactorLuminousIntensityExponent', newValue);
  }

  int get logicalMinimum => js_util.getProperty(this, 'logicalMinimum');
  set logicalMinimum(int newValue) {
    js_util.setProperty(this, 'logicalMinimum', newValue);
  }

  int get logicalMaximum => js_util.getProperty(this, 'logicalMaximum');
  set logicalMaximum(int newValue) {
    js_util.setProperty(this, 'logicalMaximum', newValue);
  }

  int get physicalMinimum => js_util.getProperty(this, 'physicalMinimum');
  set physicalMinimum(int newValue) {
    js_util.setProperty(this, 'physicalMinimum', newValue);
  }

  int get physicalMaximum => js_util.getProperty(this, 'physicalMaximum');
  set physicalMaximum(int newValue) {
    js_util.setProperty(this, 'physicalMaximum', newValue);
  }

  Iterable<String> get strings => js_util.getProperty(this, 'strings');
  set strings(Iterable<String> newValue) {
    js_util.setProperty(this, 'strings', newValue);
  }
}

enum HIDUnitSystem {
  none,
  siLinear,
  siRotation,
  englishLinear,
  englishRotation,
  vendorDefined,
  reserved
}