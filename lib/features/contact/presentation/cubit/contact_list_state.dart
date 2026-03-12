import 'package:mobile_test_nextlab/features/contact/domain/entities/contact_entity.dart';

abstract class ContactListState {}

class ContactInitial extends ContactListState {}

class ContactLoading extends ContactListState {}

class ContactLoaded extends ContactListState {
  final List<ContactEntity> contacts;
  ContactLoaded(this.contacts);
}

class ContactFailure extends ContactListState {
  final String error;
  ContactFailure(this.error);
}
