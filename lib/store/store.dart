import 'package:architecto/store/organization.dart';
import 'package:get/get.dart';

class Store {
  static final OrganizationStore organizationStore = OrganizationStore();

  static void init() {
    Get.put(organizationStore);
  }
}
