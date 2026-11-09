// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReguest _$LoginReguestFromJson(Map<String, dynamic> json) => LoginReguest(
  login: json['login'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$LoginReguestToJson(LoginReguest instance) =>
    <String, dynamic>{'login': instance.login, 'password': instance.password};

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      fio: json['fio'] as String,
      photoUrl: json['photoUrl'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'fio': instance.fio,
      'photoUrl': instance.photoUrl,
      'role': instance.role,
    };
