///
//  Generated code. Do not modify.
//  source: ratel.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'ratel.pbenum.dart';

export 'ratel.pbenum.dart';

class CommandRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CommandRequest', createEmptyInstance: create)
    ..e<InstType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'src', $pb.PbFieldType.QE, defaultOrMaker: InstType.INSTTYPE_INSTRUMENT, valueOf: InstType.valueOf, enumValues: InstType.values)
    ..e<InstType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dst', $pb.PbFieldType.QE, defaultOrMaker: InstType.INSTTYPE_INSTRUMENT, valueOf: InstType.valueOf, enumValues: InstType.values)
    ..e<CommandType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmd', $pb.PbFieldType.QE, defaultOrMaker: CommandType.CMDTYPE_UNKOWN, valueOf: CommandType.valueOf, enumValues: CommandType.values)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seq', $pb.PbFieldType.QU3)
    ..e<CommandClass>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'class', $pb.PbFieldType.QE, defaultOrMaker: CommandClass.CLASS_INFORMATION, valueOf: CommandClass.valueOf, enumValues: CommandClass.values)
    ..e<FunctionID>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'func', $pb.PbFieldType.QE, defaultOrMaker: FunctionID.INFO_GET_TRANSMIT, valueOf: FunctionID.valueOf, enumValues: FunctionID.values)
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gasEnable', protoName: 'gasEnable')
  ;

  CommandRequest._() : super();
  factory CommandRequest({
    InstType? src,
    InstType? dst,
    CommandType? cmd,
    $core.int? seq,
    CommandClass? class_5,
    FunctionID? func,
    $core.bool? gasEnable,
  }) {
    final _result = create();
    if (src != null) {
      _result.src = src;
    }
    if (dst != null) {
      _result.dst = dst;
    }
    if (cmd != null) {
      _result.cmd = cmd;
    }
    if (seq != null) {
      _result.seq = seq;
    }
    if (class_5 != null) {
      _result.class_5 = class_5;
    }
    if (func != null) {
      _result.func = func;
    }
    if (gasEnable != null) {
      _result.gasEnable = gasEnable;
    }
    return _result;
  }
  factory CommandRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommandRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommandRequest clone() => CommandRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommandRequest copyWith(void Function(CommandRequest) updates) => super.copyWith((message) => updates(message as CommandRequest)) as CommandRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommandRequest create() => CommandRequest._();
  CommandRequest createEmptyInstance() => create();
  static $pb.PbList<CommandRequest> createRepeated() => $pb.PbList<CommandRequest>();
  @$core.pragma('dart2js:noInline')
  static CommandRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommandRequest>(create);
  static CommandRequest? _defaultInstance;

  @$pb.TagNumber(1)
  InstType get src => $_getN(0);
  @$pb.TagNumber(1)
  set src(InstType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSrc() => $_has(0);
  @$pb.TagNumber(1)
  void clearSrc() => clearField(1);

  @$pb.TagNumber(2)
  InstType get dst => $_getN(1);
  @$pb.TagNumber(2)
  set dst(InstType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDst() => $_has(1);
  @$pb.TagNumber(2)
  void clearDst() => clearField(2);

  @$pb.TagNumber(3)
  CommandType get cmd => $_getN(2);
  @$pb.TagNumber(3)
  set cmd(CommandType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCmd() => $_has(2);
  @$pb.TagNumber(3)
  void clearCmd() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get seq => $_getIZ(3);
  @$pb.TagNumber(4)
  set seq($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSeq() => $_has(3);
  @$pb.TagNumber(4)
  void clearSeq() => clearField(4);

  @$pb.TagNumber(5)
  CommandClass get class_5 => $_getN(4);
  @$pb.TagNumber(5)
  set class_5(CommandClass v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasClass_5() => $_has(4);
  @$pb.TagNumber(5)
  void clearClass_5() => clearField(5);

  @$pb.TagNumber(6)
  FunctionID get func => $_getN(5);
  @$pb.TagNumber(6)
  set func(FunctionID v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFunc() => $_has(5);
  @$pb.TagNumber(6)
  void clearFunc() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get gasEnable => $_getBF(6);
  @$pb.TagNumber(7)
  set gasEnable($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGasEnable() => $_has(6);
  @$pb.TagNumber(7)
  void clearGasEnable() => clearField(7);
}

class BLEInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BLEInfo', createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceNm', protoName: 'deviceNm')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'macAddr', $pb.PbFieldType.QY, protoName: 'macAddr')
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fwVersion', protoName: 'fwVersion')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'instId', $pb.PbFieldType.QY, protoName: 'instId')
  ;

  BLEInfo._() : super();
  factory BLEInfo({
    $core.String? deviceNm,
    $core.List<$core.int>? macAddr,
    $core.String? fwVersion,
    $core.List<$core.int>? instId,
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
    return _result;
  }
  factory BLEInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BLEInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BLEInfo clone() => BLEInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BLEInfo copyWith(void Function(BLEInfo) updates) => super.copyWith((message) => updates(message as BLEInfo)) as BLEInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BLEInfo create() => BLEInfo._();
  BLEInfo createEmptyInstance() => create();
  static $pb.PbList<BLEInfo> createRepeated() => $pb.PbList<BLEInfo>();
  @$core.pragma('dart2js:noInline')
  static BLEInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BLEInfo>(create);
  static BLEInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceNm => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceNm($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceNm() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceNm() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get macAddr => $_getN(1);
  @$pb.TagNumber(2)
  set macAddr($core.List<$core.int> v) { $_setBytes(1, v); }
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
  $core.List<$core.int> get instId => $_getN(3);
  @$pb.TagNumber(4)
  set instId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInstId() => $_has(3);
  @$pb.TagNumber(4)
  void clearInstId() => clearField(4);
}

class Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Response', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seq', $pb.PbFieldType.QU3)
    ..a<$core.bool>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success', $pb.PbFieldType.QB)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
  ;

  Response._() : super();
  factory Response({
    $core.int? seq,
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (seq != null) {
      _result.seq = seq;
    }
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get seq => $_getIZ(0);
  @$pb.TagNumber(1)
  set seq($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSeq() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeq() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

