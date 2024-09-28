import 'package:architecto/models/audit.dart';
import 'package:architecto/models/member.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Invitations {
  final String email;
  final MemberRole role;
  final String invitedBy;
  final Audit audit;

  Invitations({
    required this.email,
    required this.role,
    required this.invitedBy,
    required this.audit,
  });

  String _roleToString(MemberRole role) {
    return role.toString().split('.').last;
  }

  factory Invitations.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Invitations(
      email: data['email'] ?? '',
      role: MemberRole.values
          .firstWhere((e) => e.toString().split('.').last == data['role']),
      invitedBy: data['invitedBy'] ?? '',
      audit: Audit.fromFirestore(data),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'role': _roleToString(role),
      'invitedBy': invitedBy,
      ...audit.toFirestore(),
    };
  }
}
