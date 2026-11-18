import 'package:json_annotation/json_annotation.dart';
import 'package:shared/bd.dart';
part 'shared.g.dart';

@JsonSerializable()
class const LoginReguest({
  required final String login,
  required final String password,
}) {
  factory LoginReguest.fromJson(Map<String, dynamic> json) =>
      _$LoginReguestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReguestToJson(this);
}

@JsonSerializable()
class const LoginResponse({
  required final String fio,
  required final String photoUrl,
  required final String role,
}) {
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class const CountRequest() {
  factory CountRequest.fromJson(Map<String, dynamic> json) =>
      _$CountRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CountRequestToJson(this);
}

@JsonSerializable()
class const CountResponse({required final int count}) {
  factory CountResponse.fromJson(Map<String, dynamic> json) =>
      _$CountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CountResponseToJson(this);
}

@JsonSerializable()
class const CreateUserRequest(final OurClient clientData) {
  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}

@JsonSerializable()
class const CreateUserResponse() {
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}

@JsonSerializable()
class const SeekFioRequest() {
  factory SeekFioRequest.fromJson(Map<String, dynamic> json) =>
      _$SeekFioRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SeekFioRequestToJson(this);
}

@JsonSerializable()
class const SeekFioResponse({required final List<String> names}) {
  factory SeekFioResponse.fromJson(Map<String, dynamic> json) =>
      _$SeekFioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SeekFioResponseToJson(this);
}

@JsonSerializable()
class OurClient {
  String password;
  String name;
  String login;
  String birthday;
  String email;
  String phone;
  String nameEnterprise;
  OurClient({
    required this.password,
    required this.name,
    required this.login,
    required this.birthday,
    required this.email,
    required this.phone,
    required this.nameEnterprise,
  });
  factory OurClient.fromJson(Map<String, dynamic> json) =>
      _$OurClientFromJson(json);
  Map<String, dynamic> toJson() => _$OurClientToJson(this);
}

@JsonSerializable()
class const SeekServiceRequest() {
  factory SeekServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$SeekServiceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SeekServiceRequestToJson(this);
}

@JsonSerializable()
class const SeekServiceResponse({required final List<String> names}) {
  factory SeekServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$SeekServiceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SeekServiceResponseToJson(this);
}
