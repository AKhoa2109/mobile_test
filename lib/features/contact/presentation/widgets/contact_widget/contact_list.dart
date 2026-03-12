import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test_nextlab/features/contact/domain/entities/contact_entity.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/cubit/contact_list_cubit.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/cubit/contact_list_state.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/widgets/contact_widget/contact_title.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactListState>(
      builder: (context, state) {
        if (state is ContactLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ContactFailure) {
          return Center(child: Text('Lỗi: ${state.error}'));
        }
        if (state is ContactLoaded) {
          return _buildList(state.contacts);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildList(List<ContactEntity> contacts) {
    return ListView.separated(
      itemCount: contacts.length,
      separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
      itemBuilder: (context, index) => ContactTitle(contact: contacts[index]),
    );
  }
}
