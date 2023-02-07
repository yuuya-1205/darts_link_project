import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference, DocumentReference> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(DocumentReference documentReference) {
    return documentReference;
  }

  @override
  DocumentReference toJson(DocumentReference documentReference) {
    return documentReference;
  }
}
