import 'package:mobile_test_nextlab/features/contact/domain/entities/contact_entity.dart';

abstract class ContactRepository {
  Future<List<ContactEntity>> loadListContact();
}
