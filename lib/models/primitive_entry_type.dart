import 'json_node.dart';

enum PrimitiveEntryType { string, int64, double_, boolean, timestamp }

extension PrimitiveEntryTypeExt on PrimitiveEntryType {
  String get label => switch (this) {
        PrimitiveEntryType.string => 'String',
        PrimitiveEntryType.int64 => 'Int64',
        PrimitiveEntryType.double_ => 'Double',
        PrimitiveEntryType.boolean => 'Boolean',
        PrimitiveEntryType.timestamp => 'Timestamp',
      };

  dynamic get defaultValue => switch (this) {
        PrimitiveEntryType.string => '',
        PrimitiveEntryType.int64 => 0,
        PrimitiveEntryType.double_ => 0.0,
        PrimitiveEntryType.boolean => false,
        PrimitiveEntryType.timestamp => '',
      };

  EntryType get entryType => switch (this) {
        PrimitiveEntryType.string => EntryType.string,
        PrimitiveEntryType.int64 => EntryType.int64,
        PrimitiveEntryType.double_ => EntryType.double_,
        PrimitiveEntryType.boolean => EntryType.boolean,
        PrimitiveEntryType.timestamp => EntryType.timestamp,
      };
}
