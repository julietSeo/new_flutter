///
//  Generated code. Do not modify.
//  source: ratel.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use commandTypeDescriptor instead')
const CommandType$json = const {
  '1': 'CommandType',
  '2': const [
    const {'1': 'CMDTYPE_UNKOWN', '2': 0},
    const {'1': 'CMDTYPE_REQUEST', '2': 1},
    const {'1': 'CMDTYPE_REQ_VERSION', '2': 2},
  ],
};

/// Descriptor for `CommandType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List commandTypeDescriptor = $convert.base64Decode('CgtDb21tYW5kVHlwZRISCg5DTURUWVBFX1VOS09XThAAEhMKD0NNRFRZUEVfUkVRVUVTVBABEhcKE0NNRFRZUEVfUkVRX1ZFUlNJT04QAg==');
@$core.Deprecated('Use instTypeDescriptor instead')
const InstType$json = const {
  '1': 'InstType',
  '2': const [
    const {'1': 'INSTTYPE_INSTRUMENT', '2': 0},
    const {'1': 'INSTTYPE_PC', '2': 1},
    const {'1': 'INSTTYPE_MOBILE', '2': 2},
    const {'1': 'INSTTYPE_BLE', '2': 3},
  ],
};

/// Descriptor for `InstType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List instTypeDescriptor = $convert.base64Decode('CghJbnN0VHlwZRIXChNJTlNUVFlQRV9JTlNUUlVNRU5UEAASDwoLSU5TVFRZUEVfUEMQARITCg9JTlNUVFlQRV9NT0JJTEUQAhIQCgxJTlNUVFlQRV9CTEUQAw==');
@$core.Deprecated('Use commandClassDescriptor instead')
const CommandClass$json = const {
  '1': 'CommandClass',
  '2': const [
    const {'1': 'CLASS_INFORMATION', '2': 0},
    const {'1': 'CLASS_MONITORING', '2': 1},
    const {'1': 'CLASS_SENSOR', '2': 2},
  ],
};

/// Descriptor for `CommandClass`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List commandClassDescriptor = $convert.base64Decode('CgxDb21tYW5kQ2xhc3MSFQoRQ0xBU1NfSU5GT1JNQVRJT04QABIUChBDTEFTU19NT05JVE9SSU5HEAESEAoMQ0xBU1NfU0VOU09SEAI=');
@$core.Deprecated('Use functionIDDescriptor instead')
const FunctionID$json = const {
  '1': 'FunctionID',
  '2': const [
    const {'1': 'INFO_GET_TRANSMIT', '2': 0},
    const {'1': 'INFO_GET_SENSOR', '2': 1},
    const {'1': 'INFO_SEND_BLE', '2': 2},
    const {'1': 'INFO_GET_BLE', '2': 3},
  ],
};

/// Descriptor for `FunctionID`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List functionIDDescriptor = $convert.base64Decode('CgpGdW5jdGlvbklEEhUKEUlORk9fR0VUX1RSQU5TTUlUEAASEwoPSU5GT19HRVRfU0VOU09SEAESEQoNSU5GT19TRU5EX0JMRRACEhAKDElORk9fR0VUX0JMRRAD');
@$core.Deprecated('Use commandRequestDescriptor instead')
const CommandRequest$json = const {
  '1': 'CommandRequest',
  '2': const [
    const {'1': 'src', '3': 1, '4': 2, '5': 14, '6': '.InstType', '10': 'src'},
    const {'1': 'dst', '3': 2, '4': 2, '5': 14, '6': '.InstType', '10': 'dst'},
    const {'1': 'cmd', '3': 3, '4': 2, '5': 14, '6': '.CommandType', '10': 'cmd'},
    const {'1': 'seq', '3': 4, '4': 2, '5': 13, '10': 'seq'},
    const {'1': 'class', '3': 5, '4': 2, '5': 14, '6': '.CommandClass', '10': 'class'},
    const {'1': 'func', '3': 6, '4': 2, '5': 14, '6': '.FunctionID', '10': 'func'},
    const {'1': 'gasEnable', '3': 7, '4': 1, '5': 8, '10': 'gasEnable'},
  ],
};

/// Descriptor for `CommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandRequestDescriptor = $convert.base64Decode('Cg5Db21tYW5kUmVxdWVzdBIbCgNzcmMYASACKA4yCS5JbnN0VHlwZVIDc3JjEhsKA2RzdBgCIAIoDjIJLkluc3RUeXBlUgNkc3QSHgoDY21kGAMgAigOMgwuQ29tbWFuZFR5cGVSA2NtZBIQCgNzZXEYBCACKA1SA3NlcRIjCgVjbGFzcxgFIAIoDjINLkNvbW1hbmRDbGFzc1IFY2xhc3MSHwoEZnVuYxgGIAIoDjILLkZ1bmN0aW9uSURSBGZ1bmMSHAoJZ2FzRW5hYmxlGAcgASgIUglnYXNFbmFibGU=');
@$core.Deprecated('Use bLEInfoDescriptor instead')
const BLEInfo$json = const {
  '1': 'BLEInfo',
  '2': const [
    const {'1': 'deviceNm', '3': 1, '4': 2, '5': 9, '10': 'deviceNm'},
    const {'1': 'macAddr', '3': 2, '4': 2, '5': 12, '10': 'macAddr'},
    const {'1': 'fwVersion', '3': 3, '4': 2, '5': 9, '10': 'fwVersion'},
    const {'1': 'instId', '3': 4, '4': 2, '5': 12, '10': 'instId'},
  ],
};

/// Descriptor for `BLEInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bLEInfoDescriptor = $convert.base64Decode('CgdCTEVJbmZvEhoKCGRldmljZU5tGAEgAigJUghkZXZpY2VObRIYCgdtYWNBZGRyGAIgAigMUgdtYWNBZGRyEhwKCWZ3VmVyc2lvbhgDIAIoCVIJZndWZXJzaW9uEhYKBmluc3RJZBgEIAIoDFIGaW5zdElk');
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'seq', '3': 1, '4': 2, '5': 13, '10': 'seq'},
    const {'1': 'success', '3': 2, '4': 2, '5': 8, '10': 'success'},
    const {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIQCgNzZXEYASACKA1SA3NlcRIYCgdzdWNjZXNzGAIgAigIUgdzdWNjZXNzEhAKA21zZxgDIAEoCVIDbXNn');
