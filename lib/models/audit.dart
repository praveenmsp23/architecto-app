import 'package:cloud_firestore/cloud_firestore.dart';

class Audit {
  final Timestamp created;
  final Timestamp updated;
  final String createdBy;
  final String updatedBy;

  Audit({
    required this.created,
    required this.updated,
    required this.createdBy,
    required this.updatedBy,
  });

  factory Audit.defaultAudit(String userId) {
    return Audit(
      created: Timestamp.now(),
      updated: Timestamp(0, 0),
      createdBy: userId,
      updatedBy: "",
    );
  }

  factory Audit.fromFirestore(Map<String, dynamic> data) {
    return Audit(
      created: data['created'] ?? Timestamp.now(),
      updated: data['updated'] ?? Timestamp(0, 0),
      createdBy: data['createdBy'] ?? '',
      updatedBy: data['updatedBy'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'created': created,
      'updated': updated,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
    };
  }
}
