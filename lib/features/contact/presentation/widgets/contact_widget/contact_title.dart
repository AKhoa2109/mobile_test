import 'package:flutter/material.dart';
import 'package:mobile_test_nextlab/features/contact/domain/entities/contact_entity.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/widgets/contact_widget/contact_detail_sheet.dart';

class ContactTitle extends StatelessWidget {
  final ContactEntity contact;
  const ContactTitle({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initials = _getInitials(contact.name);
    final color = _colorFromName(contact.name, theme);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          initials,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      title: Text(
        contact.name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        contact.phone,
        style: TextStyle(color: Colors.grey[600], fontSize: 13),
      ),
      trailing: SizedBox(
        width: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.phone, size: 20),
              onPressed: () {},
              color: theme.colorScheme.primary,
            ),
            IconButton(
              icon: const Icon(Icons.email_rounded, size: 20),
              onPressed: () {},
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
      onTap: () => _showContactDetail(context, contact),
    );
  }

  void _showContactDetail(BuildContext context, ContactEntity contact) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => ContactDetailSheet(contact: contact),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  Color _colorFromName(String name, ThemeData theme) {
    final colors = [
      Colors.indigo,
      Colors.teal,
      Colors.deepPurple,
      Colors.cyan,
      Colors.blueGrey,
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];
    return colors[contact.id % colors.length];
  }
}
