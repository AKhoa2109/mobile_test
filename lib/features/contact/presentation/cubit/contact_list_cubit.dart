import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test_nextlab/features/contact/domain/usecase/load_contact_list_usecase.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/cubit/contact_list_state.dart';

class ContactCubit extends Cubit<ContactListState> {
  final LoadContactListUsecase loadContactList;
  ContactCubit(this.loadContactList) : super(ContactInitial());

  Future<void> loadContacts() async {
    emit(ContactLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final contacts = await loadContactList();
      emit(ContactLoaded(contacts));
    } catch (e) {
      emit(ContactFailure(e.toString()));
    }
  }
}
