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
      id: json['Id'] as String,
      name: json['Name'] as String,
      email: json['Email'] as String,
      userType: json['UserType'] as String,
    );
  }
}