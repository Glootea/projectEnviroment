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

CountRequest _$CountRequestFromJson(Map<String, dynamic> json) =>
    CountRequest();

Map<String, dynamic> _$CountRequestToJson(CountRequest instance) =>
    <String, dynamic>{};

CountResponse _$CountResponseFromJson(Map<String, dynamic> json) =>
    CountResponse(count: (json['count'] as num).toInt());

Map<String, dynamic> _$CountResponseToJson(CountResponse instance) =>
    <String, dynamic>{'count': instance.count};

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) =>
    CreateUserRequest(
      OurClient.fromJson(json['clientData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{'clientData': instance.clientData};

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) =>
    CreateUserResponse();

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{};

SeekFioRequest _$SeekFioRequestFromJson(Map<String, dynamic> json) =>
    SeekFioRequest();

Map<String, dynamic> _$SeekFioRequestToJson(SeekFioRequest instance) =>
    <String, dynamic>{};

SeekFioResponse _$SeekFioResponseFromJson(Map<String, dynamic> json) =>
    SeekFioResponse(
      names: (json['names'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SeekFioResponseToJson(SeekFioResponse instance) =>
    <String, dynamic>{'names': instance.names};

OurClient _$OurClientFromJson(Map<String, dynamic> json) => OurClient(
  password: json['password'] as String,
  name: json['name'] as String,
  login: json['login'] as String,
  birthday: json['birthday'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  nameEnterprise: json['nameEnterprise'] as String,
);

Map<String, dynamic> _$OurClientToJson(OurClient instance) => <String, dynamic>{
  'password': instance.password,
  'name': instance.name,
  'login': instance.login,
  'birthday': instance.birthday,
  'email': instance.email,
  'phone': instance.phone,
  'nameEnterprise': instance.nameEnterprise,
};
