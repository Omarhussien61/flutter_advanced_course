import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  String? token;
  @JsonKey(name: 'user')
  UserData? userData;
  bool? status;
  int? code;

  LoginResponse({this.message, this.userData, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? provider;
  String? providerId;
  String? otp;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.provider,
        this.providerId,
        this.otp,
        this.createdAt,
        this.updatedAt});




  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
