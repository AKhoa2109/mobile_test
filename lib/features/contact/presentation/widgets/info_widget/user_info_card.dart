import 'package:flutter/material.dart';
import 'package:mobile_test_nextlab/features/auth/domain/entities/user_entity.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/widgets/info_widget/info_row.dart';

class UserInfoCard extends StatelessWidget {
  final UserEntity user;
  const UserInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      color: theme.colorScheme.primaryContainer.withOpacity(0.3),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: theme.colorScheme.primary,
            child: Text(
              _getInitials(user.username ?? user.email),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.username ?? 'Người dùng',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                InfoRow(icon: Icons.email_outlined, text: user.email),
                if (user.phone != null) ...[
                  const SizedBox(height: 2),
                  InfoRow(icon: Icons.phone_outlined, text: user.phone!),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}
