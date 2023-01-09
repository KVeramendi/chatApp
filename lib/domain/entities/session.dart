class Session{
  final String token;
  final int expiresIn;
  final DateTime createdAt;

  Session({
    required this.token,
    required this.expiresIn,
    required this.createdAt
  });
}