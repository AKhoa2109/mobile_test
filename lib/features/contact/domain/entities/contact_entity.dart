class ContactEntity {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String? avatarUrl;

  const ContactEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.avatarUrl,
  });
}