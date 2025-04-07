// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class UserModel {
  final String email;
  final String registerType;
  final String imageAvartar;
  UserModel({
    required this.email,
    required this.registerType,
    required this.imageAvartar,
  });

  UserModel copyWith({
    String? email,
    String? registerType,
    String? imageAvartar,
  }) {
    return UserModel(
      email: email ?? this.email,
      registerType: registerType ?? this.registerType,
      imageAvartar: imageAvartar ?? this.imageAvartar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'registerType': registerType,
      'imageAvartar': imageAvartar,
    };
  }

  factory UserModel.empit(){
    return UserModel(
      email: '',
      registerType: '',
      imageAvartar: '',
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: (map['email'] ?? '') as String,
      registerType: (map['registerType'] ?? '') as String,
      imageAvartar: (map['imageAvartar'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(email: $email, registerType: $registerType, imageAvartar: $imageAvartar)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.registerType == registerType &&
      other.imageAvartar == imageAvartar;
  }

  @override
  int get hashCode => email.hashCode ^ registerType.hashCode ^ imageAvartar.hashCode;
}
