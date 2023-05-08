class User {
  final String id;
  final String name;
  final String email;
  final String userType;

  const User({
    required this.name,
    required this.id,
    required this.email,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      userType: json['userType'] as String,
    );
  }
}