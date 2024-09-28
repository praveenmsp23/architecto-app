import 'package:architecto/models/audit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum MemberRole {
  owner,
  admin,
  viewer,
}

class Member {
  final String user;
  final String email;
  final MemberRole role;
  final Audit audit;

  Member({
    required this.user,
    required this.email,
    required this.role,
    required this.audit,
  });

  String _roleToString(MemberRole role) {
    return role.toString().split('.').last;
  }

  factory Member.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Member(
      user: data['user'] ?? '',
      email: data['email'] ?? '',
      role: MemberRole.values
          .firstWhere((e) => e.toString().split('.').last == data['role']),
      audit: Audit.fromFirestore(data),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'user': user,
      'email': email,
      'role': _roleToString(role),
      ...audit.toFirestore(),
    };
  }
}
