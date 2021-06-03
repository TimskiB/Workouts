import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'gcomponents_record.g.dart';

abstract class GcomponentsRecord
    implements Built<GcomponentsRecord, GcomponentsRecordBuilder> {
  static Serializer<GcomponentsRecord> get serializer =>
      _$gcomponentsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get url;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  Timestamp get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GcomponentsRecordBuilder builder) => builder
    ..name = ''
    ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Gcomponents');

  static Stream<GcomponentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GcomponentsRecord._();
  factory GcomponentsRecord([void Function(GcomponentsRecordBuilder) updates]) =
      _$GcomponentsRecord;
}

Map<String, dynamic> createGcomponentsRecordData({
  String name,
  String url,
  Timestamp createdAt,
}) =>
    serializers.serializeWith(
        GcomponentsRecord.serializer,
        GcomponentsRecord((g) => g
          ..name = name
          ..url = url
          ..createdAt = createdAt));

GcomponentsRecord get dummyGcomponentsRecord {
  final builder = GcomponentsRecordBuilder()
    ..name = dummyString
    ..url = dummyVideoPath
    ..createdAt = dummyTimestamp;
  return builder.build();
}

List<GcomponentsRecord> createDummyGcomponentsRecord({int count}) =>
    List.generate(count, (_) => dummyGcomponentsRecord);
