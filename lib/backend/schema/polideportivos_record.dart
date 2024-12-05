import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PolideportivosRecord extends FirestoreRecord {
  PolideportivosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _photo = snapshotData['photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('polideportivos');

  static Stream<PolideportivosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PolideportivosRecord.fromSnapshot(s));

  static Future<PolideportivosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PolideportivosRecord.fromSnapshot(s));

  static PolideportivosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PolideportivosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PolideportivosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PolideportivosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PolideportivosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PolideportivosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPolideportivosRecordData({
  String? nombre,
  String? descripcion,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class PolideportivosRecordDocumentEquality
    implements Equality<PolideportivosRecord> {
  const PolideportivosRecordDocumentEquality();

  @override
  bool equals(PolideportivosRecord? e1, PolideportivosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(PolideportivosRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.descripcion, e?.photo]);

  @override
  bool isValidKey(Object? o) => o is PolideportivosRecord;
}
