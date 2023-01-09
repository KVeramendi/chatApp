class User{
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  String? password;
  String? imageId;
  String? imageUrl;
  final bool online;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.password,
    this.imageId,
    this.imageUrl,
    required this.online
  });
}