import 'package:architecto/models/audit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SiteLocation {
  final double latitude;
  final double longitude;

  SiteLocation({
    required this.latitude,
    required this.longitude,
  });

  factory SiteLocation.defaultSiteLocation() {
    return SiteLocation(
      latitude: 0.0,
      longitude: 0.0,
    );
  }

  factory SiteLocation.fromFirestore(Map<String, dynamic> data) {
    return SiteLocation(
      latitude: data['latitude']?.toDouble() ?? 0.0,
      longitude: data['longitude']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class Site {
  final String name;
  final SiteLocation location;
  final String organization;
  final Audit audit;

  Site({
    required this.name,
    required this.location,
    required this.organization,
    required this.audit,
  });

  factory Site.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Site(
      name: data['name'] ?? '',
      location: SiteLocation.fromFirestore(data['location'] ?? {}),
      organization: data['organization'] ?? '',
      audit: Audit.fromFirestore(data),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'location': location.toFirestore(),
      'organization': organization,
      ...audit.toFirestore(),
    };
  }
}
