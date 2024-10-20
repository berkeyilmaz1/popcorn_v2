// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetails _$AccountDetailsFromJson(Map<String, dynamic> json) =>
    AccountDetails(
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      iso6391: json['iso6391'] as String?,
      iso31661: json['iso31661'] as String?,
      name: json['name'] as String?,
      includeAdult: json['include_adult'] as bool?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$AccountDetailsToJson(AccountDetails instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'id': instance.id,
      'iso6391': instance.iso6391,
      'iso31661': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      gravatar: json['gravatar'] == null
          ? null
          : Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: json['tmdb'] == null
          ? null
          : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'gravatar': instance.gravatar,
      'tmdb': instance.tmdb,
    };

Gravatar _$GravatarFromJson(Map<String, dynamic> json) => Gravatar(
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$GravatarToJson(Gravatar instance) => <String, dynamic>{
      'hash': instance.hash,
    };

Tmdb _$TmdbFromJson(Map<String, dynamic> json) => Tmdb(
      avatarPath: json['avatar_path'] as String?,
    );

Map<String, dynamic> _$TmdbToJson(Tmdb instance) => <String, dynamic>{
      'avatar_path': instance.avatarPath,
    };
