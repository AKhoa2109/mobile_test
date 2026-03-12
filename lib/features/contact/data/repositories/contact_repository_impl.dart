import 'package:mobile_test_nextlab/core/constants/app_constants.dart';
import 'package:mobile_test_nextlab/features/contact/data/models/contact_model.dart';
import 'package:mobile_test_nextlab/features/contact/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl extends ContactRepository {
  @override
  Future<List<ContactModel>> loadListContact() async {
    try {
      return AppConstants.mockContacts
          .map(
            (c) => ContactModel(
              id: c['id'],
              name: c['name'],
              phone: c['phone'],
              email: c['email'],
              avatarUrl: c['avatarUrl'],
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Loaded failed');
    }
  }
}
