import 'package:json_annotation/json_annotation.dart';

part 'token_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class TokenDto {
  Data? data;

  TokenDto({
    this.data,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Data {
  int? id;
  String? uuid;
  String? name;
  String? email;
  int? status;
  int? isAdmin;
  String? token;
  Roles? roles;
  List<String>? permission;

  Data(
      {this.id,
      this.uuid,
      this.name,
      this.email,
      this.status,
      this.isAdmin,
      this.token,
      this.roles,
      this.permission});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Roles {
  int? id;
  String? name;
  Roles({this.id, this.name});

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}
