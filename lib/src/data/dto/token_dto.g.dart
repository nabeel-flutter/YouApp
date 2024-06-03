// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) => TokenDto(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  return val;
}

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: (json['status'] as num?)?.toInt(),
      isAdmin: (json['is_admin'] as num?)?.toInt(),
      token: json['token'] as String?,
      roles: json['roles'] == null
          ? null
          : Roles.fromJson(json['roles'] as Map<String, dynamic>),
      permission: (json['permission'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('uuid', instance.uuid);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('status', instance.status);
  writeNotNull('is_admin', instance.isAdmin);
  writeNotNull('token', instance.token);
  writeNotNull('roles', instance.roles?.toJson());
  writeNotNull('permission', instance.permission);
  return val;
}

Roles _$RolesFromJson(Map<String, dynamic> json) => Roles(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RolesToJson(Roles instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}
