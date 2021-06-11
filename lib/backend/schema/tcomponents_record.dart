import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'tcomponents_record.g.dart';

abstract class TcomponentsRecord
    implements Built<TcomponentsRecord, TcomponentsRecordBuilder> {
  static Serializer<TcomponentsRecord> get serializer =>
      _$tcomponentsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get url;

  @nullable
  bool get completed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TcomponentsRecordBuilder builder) => builder
    ..name = ''
    ..url = ''
    ..completed = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tcomponents');

  static Stream<TcomponentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TcomponentsRecord._();
  factory TcomponentsRecord([void Function(TcomponentsRecordBuilder) updates]) =
      _$TcomponentsRecord;
}

Map<String, dynamic> createTcomponentsRecordData({
  String name,
  String url,
  bool completed,
}) =>
    serializers.serializeWith(
        TcomponentsRecord.serializer,
        TcomponentsRecord((t) => t
          ..name = name
          ..url = url
          ..completed = completed));

TcomponentsRecord get dummyTcomponentsRecord {
  final builder = TcomponentsRecordBuilder()
    ..name = dummyString
    ..url = dummyString
    ..completed = dummyBoolean;
  return builder.build();
}

List<TcomponentsRecord> createDummyTcomponentsRecord({int count}) =>
    List.generate(count, (_) => dummyTcomponentsRecord);
