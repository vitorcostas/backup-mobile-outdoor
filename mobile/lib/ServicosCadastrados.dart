import 'package:outdoor/User.dart';

class ServicosCadastrados {
  final String id;
  final String categoryId;
  final String title;
  final String city;
  final String contacNumber;
  final String district;
  final String state;
  final String description;
  final String image;
  final String rating;


  // final User user;

  const ServicosCadastrados({
    required this.categoryId,
    required this.id,
    required this.title,
    required this.city,
    required this.contacNumber,
    required this.district,
    required this.state,
    required this.description,
    required this.image,
    required this.rating,
    // required this.user
  });

  factory ServicosCadastrados.fromJson(Map<String, dynamic> json) {
    return ServicosCadastrados(
      id: json['id'] as String,
      // user: User.fromJson(json['user']),
      categoryId: json['categoryId'] as String,
      title: json['title'] as String,
      city: json['city'] as String,
      contacNumber: json['contacNumber'] as String,
      district: json['district'] as String,
      state: json['state'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      rating: json['rating'] as String,
    );
  }
}