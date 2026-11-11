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

@JsonSerializable()
class CountRequest {
  factory CountRequest.fromJson(Map<String, dynamic> json) => _$CountRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CountRequestToJson(this);

  CountRequest();  
}
@JsonSerializable()
class CountResponse {
  factory CountResponse.fromJson(Map<String, dynamic> json) => _$CountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CountResponseToJson(this);
final int count;

  CountResponse({required this.count});
}