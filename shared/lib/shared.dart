import 'package:json_annotation/json_annotation.dart';
 part 'shared.g.dart'; 
  
@JsonSerializable()
class LoginReguest {
  factory LoginReguest.fromJson(Map<String, dynamic> json) => _$LoginReguestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReguestToJson(this);
  String login;

  String password;

  LoginReguest({required this.login, required this.password});  
}
@JsonSerializable()
class LoginResponse {
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  final String fio;
  final String photoUrl;
  final String role;

  LoginResponse({required this.fio, required this.photoUrl, required this.role});
}