///
//  Generated code. Do not modify.
//  source: ratel.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CommandType extends $pb.ProtobufEnum {
  static const CommandType CMDTYPE_UNKOWN = CommandType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CMDTYPE_UNKOWN');
  static const CommandType CMDTYPE_REQUEST = CommandType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CMDTYPE_REQUEST');
  static const CommandType CMDTYPE_REQ_VERSION = CommandType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CMDTYPE_REQ_VERSION');

  static const $core.List<CommandType> values = <CommandType> [
    CMDTYPE_UNKOWN,
    CMDTYPE_REQUEST,
    CMDTYPE_REQ_VERSION,
  ];

  static final $core.Map<$core.int, CommandType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CommandType? valueOf($core.int value) => _byValue[value];

  const CommandType._($core.int v, $core.String n) : super(v, n);
}

class InstType extends $pb.ProtobufEnum {
  static const InstType INSTTYPE_INSTRUMENT = InstType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INSTTYPE_INSTRUMENT');
  static const InstType INSTTYPE_PC = InstType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INSTTYPE_PC');
  static const InstType INSTTYPE_MOBILE = InstType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INSTTYPE_MOBILE');
  static const InstType INSTTYPE_BLE = InstType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INSTTYPE_BLE');

  static const $core.List<InstType> values = <InstType> [
    INSTTYPE_INSTRUMENT,
    INSTTYPE_PC,
    INSTTYPE_MOBILE,
    INSTTYPE_BLE,
  ];

  static final $core.Map<$core.int, InstType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InstType? valueOf($core.int value) => _byValue[value];

  const InstType._($core.int v, $core.String n) : super(v, n);
}

class CommandClass extends $pb.ProtobufEnum {
  static const CommandClass CLASS_INFORMATION = CommandClass._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_INFORMATION');
  static const CommandClass CLASS_MONITORING = CommandClass._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_MONITORING');
  static const CommandClass CLASS_SENSOR = CommandClass._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_SENSOR');

  static const $core.List<CommandClass> values = <CommandClass> [
    CLASS_INFORMATION,
    CLASS_MONITORING,
    CLASS_SENSOR,
  ];

  static final $core.Map<$core.int, CommandClass> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CommandClass? valueOf($core.int value) => _byValue[value];

  const CommandClass._($core.int v, $core.String n) : super(v, n);
}

class FunctionID extends $pb.ProtobufEnum {
  static const FunctionID INFO_GET_TRANSMIT = FunctionID._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INFO_GET_TRANSMIT');
  static const FunctionID INFO_GET_SENSOR = FunctionID._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INFO_GET_SENSOR');
  static const FunctionID INFO_SEND_BLE = FunctionID._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INFO_SEND_BLE');
  static const FunctionID INFO_GET_BLE = FunctionID._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INFO_GET_BLE');

  static const $core.List<FunctionID> values = <FunctionID> [
    INFO_GET_TRANSMIT,
    INFO_GET_SENSOR,
    INFO_SEND_BLE,
    INFO_GET_BLE,
  ];

  static final $core.Map<$core.int, FunctionID> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FunctionID? valueOf($core.int value) => _byValue[value];

  const FunctionID._($core.int v, $core.String n) : super(v, n);
}

