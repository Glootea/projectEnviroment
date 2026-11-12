import 'package:json_annotation/json_annotation.dart';
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
