import 'package:flutter/material.dart';
import 'package:mobile_test_nextlab/features/contact/domain/entities/contact_entity.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/widgets/contact_widget/detail_row.dart';

class ContactDetailSheet extends StatelessWidget {
  final ContactEntity contact;
  const ContactDetailSheet({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            contact.name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DetailRow(
            icon: Icons.phone,
            label: 'Điện thoại',
            value: contact.phone,
          ),
          const SizedBox(height: 8),
          DetailRow(icon: Icons.email, label: 'Email', value: contact.email),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
