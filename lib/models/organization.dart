import 'package:architecto/models/audit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Organization {
  final String name;
  final String? about;
  final String? address;
  final Audit audit;

  Organization({
    required this.name,
    required this.about,
    required this.address,
    required this.audit,
  });

  factory Organization.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Organization(
      name: data['name'] ?? '',
      about: data['about'] ?? '',
      address: data['address'] ?? '',
      audit: Audit.fromFirestore(data),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'about': about,
      'address': address,
      ...audit.toFirestore(),
    };
  }
}
