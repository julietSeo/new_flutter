///
//  Generated code. Do not modify.
//  source: ble.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ClassId extends $pb.ProtobufEnum {
  static const ClassId CLASS_INFORMATION = ClassId._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_INFORMATION');
  static const ClassId CLASS_MONITORING = ClassId._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_MONITORING');
  static const ClassId CLASS_CONFIG_TRANSMITTER = ClassId._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_CONFIG_TRANSMITTER');
  static const ClassId CLASS_CONFIG_SENSOR = ClassId._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_CONFIG_SENSOR');
  static const ClassId CLASS_CALIBRATION = ClassId._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_CALIBRATION');
  static const ClassId CLASS_FACTORY = ClassId._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS_FACTORY');

  static const $core.List<ClassId> values = <ClassId> [
    CLASS_INFORMATION,
    CLASS_MONITORING,
    CLASS_CONFIG_TRANSMITTER,
    CLASS_CONFIG_SENSOR,
    CLASS_CALIBRATION,
    CLASS_FACTORY,
  ];

  static final $core.Map<$core.int, ClassId> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClassId? valueOf($core.int value) => _byValue[value];

  const ClassId._($core.int v, $core.String n) : super(v, n);
}

class Objects extends $pb.ProtobufEnum {
  static const Objects MOBILE = Objects._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MOBILE');
  static const Objects INTERFACE = Objects._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTERFACE');
  static const Objects BLE_MODULE = Objects._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLE_MODULE');

  static const $core.List<Objects> values = <Objects> [
    MOBILE,
    INTERFACE,
    BLE_MODULE,
  ];

  static final $core.Map<$core.int, Objects> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Objects? valueOf($core.int value) => _byValue[value];

  const Objects._($core.int v, $core.String n) : super(v, n);
}

class Information_FuncId extends $pb.ProtobufEnum {
  static const Information_FuncId GET_TRASMITTER = Information_FuncId._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GET_TRASMITTER');
  static const Information_FuncId GET_SENSOR = Information_FuncId._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GET_SENSOR');
  static const Information_FuncId GET_BLE = Information_FuncId._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GET_BLE');
  static const Information_FuncId GET_GAS = Information_FuncId._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GET_GAS');

  static const $core.List<Information_FuncId> values = <Information_FuncId> [
    GET_TRASMITTER,
    GET_SENSOR,
    GET_BLE,
    GET_GAS,
  ];

  static final $core.Map<$core.int, Information_FuncId> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Information_FuncId? valueOf($core.int value) => _byValue[value];

  const Information_FuncId._($core.int v, $core.String n) : super(v, n);
}

