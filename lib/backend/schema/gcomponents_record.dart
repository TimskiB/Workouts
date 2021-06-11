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
  bool get completed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GcomponentsRecordBuilder builder) => builder
    ..name = ''
    ..url = ''
    ..completed = false;

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
  bool completed,
}) =>
    serializers.serializeWith(
        GcomponentsRecord.serializer,
        GcomponentsRecord((g) => g
          ..name = name
          ..url = url
          ..completed = completed));

GcomponentsRecord get dummyGcomponentsRecord {
  final builder = GcomponentsRecordBuilder()
    ..name = dummyString
    ..url = dummyString
    ..completed = dummyBoolean;
  return builder.build();
}

List<GcomponentsRecord> createDummyGcomponentsRecord({int count}) =>
    List.generate(count, (_) => dummyGcomponentsRecord);
