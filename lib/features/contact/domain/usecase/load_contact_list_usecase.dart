import 'package:mobile_test_nextlab/features/contact/domain/entities/contact_entity.dart';
import 'package:mobile_test_nextlab/features/contact/domain/repositories/contact_repository.dart';

class LoadContactListUsecase {
  ContactRepository repository;
  LoadContactListUsecase(this.repository);

  Future<List<ContactEntity>> call() => repository.loadListContact();
}