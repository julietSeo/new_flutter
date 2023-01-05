///
//  Generated code. Do not modify.
//  source: ble.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'ble.pbenum.dart';

export 'ble.pbenum.dart';

class Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Header', createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sof')
    ..e<Objects>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dst', $pb.PbFieldType.QE, defaultOrMaker: Objects.MOBILE, valueOf: Objects.valueOf, enumValues: Objects.values)
    ..e<Objects>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'src', $pb.PbFieldType.QE, defaultOrMaker: Objects.MOBILE, valueOf: Objects.valueOf, enumValues: Objects.values)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seq', $pb.PbFieldType.QU3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payLen', $pb.PbFieldType.QU3, protoName: 'payLen')
  ;

  Header._() : super();
  factory Header({
    $core.String? sof,
    Objects? dst,
    Objects? src,
    $core.int? seq,
    $core.int? payLen,
  }) {
    final _result = create();
    if (sof != null) {
      _result.sof = sof;
    }
    if (dst != null) {
      _result.dst = dst;
    }
    if (src != null) {
      _result.src = src;
    }
    if (seq != null) {
      _result.seq = seq;
    }
    if (payLen != null) {
      _result.payLen = payLen;
    }
    return _result;
  }
  factory Header.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Header.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Header clone() => Header()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Header copyWith(void Function(Header) updates) => super.copyWith((message) => updates(message as Header)) as Header; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Header create() => Header._();
  Header createEmptyInstance() => create();
  static $pb.PbList<Header> createRepeated() => $pb.PbList<Header>();
  @$core.pragma('dart2js:noInline')
  static Header getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Header>(create);
  static Header? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sof => $_getSZ(0);
  @$pb.TagNumber(1)
  set sof($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSof() => $_has(0);
  @$pb.TagNumber(1)
  void clearSof() => clearField(1);

  @$pb.TagNumber(2)
  Objects get dst => $_getN(1);
  @$pb.TagNumber(2)
  set dst(Objects v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDst() => $_has(1);
  @$pb.TagNumber(2)
  void clearDst() => clearField(2);

  @$pb.TagNumber(3)
  Objects get src => $_getN(2);
  @$pb.TagNumber(3)
  set src(Objects v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSrc() => $_has(2);
  @$pb.TagNumber(3)
  void clearSrc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get seq => $_getIZ(3);
  @$pb.TagNumber(4)
  set seq($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSeq() => $_has(3);
  @$pb.TagNumber(4)
  void clearSeq() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get payLen => $_getIZ(4);
  @$pb.TagNumber(5)
  set payLen($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPayLen() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayLen() => clearField(5);
}

class Information_BleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Information.BleInfo', createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceNm', protoName: 'deviceNm')
    ..aQS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'macAddr', protoName: 'macAddr')
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fwVersion', protoName: 'fwVersion')
    ..aQS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'instId', protoName: 'instId')
    ..e<Information_FuncId>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'function', $pb.PbFieldType.QE, defaultOrMaker: Information_FuncId.GET_TRASMITTER, valueOf: Information_FuncId.valueOf, enumValues: Information_FuncId.values)
  ;

  Information_BleInfo._() : super();
  factory Information_BleInfo({
    $core.String? deviceNm,
    $core.String? macAddr,
    $core.String? fwVersion,
    $core.String? instId,
    Information_FuncId? function,
  }) {
    final _result = create();
    if (deviceNm != null) {
      _result.deviceNm = deviceNm;
    }
    if (macAddr != null) {
      _result.macAddr = macAddr;
    }
    if (fwVersion != null) {
      _result.fwVersion = fwVersion;
    }
    if (instId != null) {
      _result.instId = instId;
    }
    if (function != null) {
      _result.function = function;
    }
    return _result;
  }
  factory Information_BleInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Information_BleInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Information_BleInfo clone() => Information_BleInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Information_BleInfo copyWith(void Function(Information_BleInfo) updates) => super.copyWith((message) => updates(message as Information_BleInfo)) as Information_BleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Information_BleInfo create() => Information_BleInfo._();
  Information_BleInfo createEmptyInstance() => create();
  static $pb.PbList<Information_BleInfo> createRepeated() => $pb.PbList<Information_BleInfo>();
  @$core.pragma('dart2js:noInline')
  static Information_BleInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Information_BleInfo>(create);
  static Information_BleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceNm => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceNm($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceNm() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceNm() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get macAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set macAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMacAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearMacAddr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fwVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set fwVersion($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFwVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearFwVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get instId => $_getSZ(3);
  @$pb.TagNumber(4)
  set instId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInstId() => $_has(3);
  @$pb.TagNumber(4)
  void clearInstId() => clearField(4);

  @$pb.TagNumber(5)
  Information_FuncId get function => $_getN(4);
  @$pb.TagNumber(5)
  set function(Information_FuncId v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFunction() => $_has(4);
  @$pb.TagNumber(5)
  void clearFunction() => clearField(5);
}

class Information extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Information', createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serialNum', protoName: 'serialNum')
  ;

  Information._() : super();
  factory Information({
    $core.String? serialNum,
  }) {
    final _result = create();
    if (serialNum != null) {
      _result.serialNum = serialNum;
    }
    return _result;
  }
  factory Information.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Information.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Information clone() => Information()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Information copyWith(void Function(Information) updates) => super.copyWith((message) => updates(message as Information)) as Information; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Information create() => Information._();
  Information createEmptyInstance() => create();
  static $pb.PbList<Information> createRepeated() => $pb.PbList<Information>();
  @$core.pragma('dart2js:noInline')
  static Information getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Information>(create);
  static Information? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serialNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set serialNum($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSerialNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearSerialNum() => clearField(1);
}

