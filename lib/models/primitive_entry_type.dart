/// primitive entry 값 타입
enum PrimitiveEntryType { string, number, boolean, nullValue }

extension PrimitiveEntryTypeExt on PrimitiveEntryType {
  String get label => switch (this) {
        PrimitiveEntryType.string => 'String',
        PrimitiveEntryType.number => 'Number',
        PrimitiveEntryType.boolean => 'Boolean',
        PrimitiveEntryType.nullValue => 'Null',
      };

  dynamic get defaultValue => switch (this) {
        PrimitiveEntryType.string => '',
        PrimitiveEntryType.number => 0,
        PrimitiveEntryType.boolean => false,
        PrimitiveEntryType.nullValue => null,
      };
}
