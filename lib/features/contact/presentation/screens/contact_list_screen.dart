import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test_nextlab/core/di/injection.dart';
import 'package:mobile_test_nextlab/features/auth/domain/entities/user_entity.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/cubit/contact_list_cubit.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/widgets/contact_widget/contact_list.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/widgets/info_widget/user_info_card.dart';

class ContactListScreen extends StatefulWidget {
  final UserEntity user;
  const ContactListScreen({super.key, required this.user});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ContactCubit>()..loadContacts(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Danh bạ'), centerTitle: true),
        body: Column(
          children: [
            UserInfoCard(user: widget.user),
            const Divider(height: 1),
            const Expanded(child: ContactList()),
          ],
        ),
      ),
    );
  }
}
