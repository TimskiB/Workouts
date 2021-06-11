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
  bool get completed;

  @nullable
  String get url;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TcomponentsRecordBuilder builder) => builder
    ..name = ''
    ..completed = false
    ..url = '';

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
  bool completed,
  String url,
}) =>
    serializers.serializeWith(
        TcomponentsRecord.serializer,
        TcomponentsRecord((t) => t
          ..name = name
          ..completed = completed
          ..url = url));

TcomponentsRecord get dummyTcomponentsRecord {
  final builder = TcomponentsRecordBuilder()
    ..name = dummyString
    ..completed = dummyBoolean
    ..url = dummyVideoPath;
  return builder.build();
}

List<TcomponentsRecord> createDummyTcomponentsRecord({int count}) =>
    List.generate(count, (_) => dummyTcomponentsRecord);
