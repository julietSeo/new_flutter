///
//  Generated code. Do not modify.
//  source: ble.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use classIdDescriptor instead')
const ClassId$json = const {
  '1': 'ClassId',
  '2': const [
    const {'1': 'CLASS_INFORMATION', '2': 0},
    const {'1': 'CLASS_MONITORING', '2': 1},
    const {'1': 'CLASS_CONFIG_TRANSMITTER', '2': 2},
    const {'1': 'CLASS_CONFIG_SENSOR', '2': 3},
    const {'1': 'CLASS_CALIBRATION', '2': 4},
    const {'1': 'CLASS_FACTORY', '2': 5},
  ],
};

/// Descriptor for `ClassId`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List classIdDescriptor = $convert.base64Decode('CgdDbGFzc0lkEhUKEUNMQVNTX0lORk9STUFUSU9OEAASFAoQQ0xBU1NfTU9OSVRPUklORxABEhwKGENMQVNTX0NPTkZJR19UUkFOU01JVFRFUhACEhcKE0NMQVNTX0NPTkZJR19TRU5TT1IQAxIVChFDTEFTU19DQUxJQlJBVElPThAEEhEKDUNMQVNTX0ZBQ1RPUlkQBQ==');
@$core.Deprecated('Use objectsDescriptor instead')
const Objects$json = const {
  '1': 'Objects',
  '2': const [
    const {'1': 'MOBILE', '2': 0},
    const {'1': 'INTERFACE', '2': 1},
    const {'1': 'BLE_MODULE', '2': 2},
  ],
};

/// Descriptor for `Objects`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List objectsDescriptor = $convert.base64Decode('CgdPYmplY3RzEgoKBk1PQklMRRAAEg0KCUlOVEVSRkFDRRABEg4KCkJMRV9NT0RVTEUQAg==');
@$core.Deprecated('Use headerDescriptor instead')
const Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'sof', '3': 1, '4': 2, '5': 9, '10': 'sof'},
    const {'1': 'dst', '3': 2, '4': 2, '5': 14, '6': '.Objects', '10': 'dst'},
    const {'1': 'src', '3': 3, '4': 2, '5': 14, '6': '.Objects', '10': 'src'},
    const {'1': 'seq', '3': 4, '4': 2, '5': 13, '10': 'seq'},
    const {'1': 'payLen', '3': 5, '4': 2, '5': 13, '10': 'payLen'},
  ],
};

/// Descriptor for `Header`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headerDescriptor = $convert.base64Decode('CgZIZWFkZXISEAoDc29mGAEgAigJUgNzb2YSGgoDZHN0GAIgAigOMgguT2JqZWN0c1IDZHN0EhoKA3NyYxgDIAIoDjIILk9iamVjdHNSA3NyYxIQCgNzZXEYBCACKA1SA3NlcRIWCgZwYXlMZW4YBSACKA1SBnBheUxlbg==');
@$core.Deprecated('Use informationDescriptor instead')
const Information$json = const {
  '1': 'Information',
  '2': const [
    const {'1': 'serialNum', '3': 1, '4': 2, '5': 9, '10': 'serialNum'},
  ],
  '3': const [Information_BleInfo$json],
  '4': const [Information_FuncId$json],
};

@$core.Deprecated('Use informationDescriptor instead')
const Information_BleInfo$json = const {
  '1': 'BleInfo',
  '2': const [
    const {'1': 'deviceNm', '3': 1, '4': 2, '5': 9, '10': 'deviceNm'},
    const {'1': 'macAddr', '3': 2, '4': 2, '5': 9, '10': 'macAddr'},
    const {'1': 'fwVersion', '3': 3, '4': 2, '5': 9, '10': 'fwVersion'},
    const {'1': 'instId', '3': 4, '4': 2, '5': 9, '10': 'instId'},
    const {'1': 'function', '3': 5, '4': 2, '5': 14, '6': '.Information.FuncId', '10': 'function'},
  ],
};

@$core.Deprecated('Use informationDescriptor instead')
const Information_FuncId$json = const {
  '1': 'FuncId',
  '2': const [
    const {'1': 'GET_TRASMITTER', '2': 0},
    const {'1': 'GET_SENSOR', '2': 1},
    const {'1': 'GET_BLE', '2': 2},
    const {'1': 'GET_GAS', '2': 3},
  ],
};

/// Descriptor for `Information`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List informationDescriptor = $convert.base64Decode('CgtJbmZvcm1hdGlvbhIcCglzZXJpYWxOdW0YASACKAlSCXNlcmlhbE51bRqmAQoHQmxlSW5mbxIaCghkZXZpY2VObRgBIAIoCVIIZGV2aWNlTm0SGAoHbWFjQWRkchgCIAIoCVIHbWFjQWRkchIcCglmd1ZlcnNpb24YAyACKAlSCWZ3VmVyc2lvbhIWCgZpbnN0SWQYBCACKAlSBmluc3RJZBIvCghmdW5jdGlvbhgFIAIoDjITLkluZm9ybWF0aW9uLkZ1bmNJZFIIZnVuY3Rpb24iRgoGRnVuY0lkEhIKDkdFVF9UUkFTTUlUVEVSEAASDgoKR0VUX1NFTlNPUhABEgsKB0dFVF9CTEUQAhILCgdHRVRfR0FTEAM=');
