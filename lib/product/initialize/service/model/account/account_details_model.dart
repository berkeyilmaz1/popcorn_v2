import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'account_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class AccountDetails extends INetworkModel<AccountDetails>
    with EquatableMixin {
  AccountDetails({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsFromJson(json);
  final Avatar? avatar;
  final int? id;
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final bool? includeAdult;
  final String? username;

  @override
  AccountDetails fromJson(Map<String, dynamic> json) =>
      AccountDetails.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AccountDetailsToJson(this);

  @override
  List<Object?> get props =>
      [avatar, id, iso6391, iso31661, name, includeAdult, username];

  AccountDetails copyWith({
    Avatar? avatar,
    int? id,
    String? iso6391,
    String? iso31661,
    String? name,
    bool? includeAdult,
    String? username,
  }) {
    return AccountDetails(
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
      includeAdult: includeAdult ?? this.includeAdult,
      username: username ?? this.username,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class Avatar extends INetworkModel<Avatar> with EquatableMixin {
  Avatar({
    this.gravatar,
    this.tmdb,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
  final Gravatar? gravatar;
  final Tmdb? tmdb;

  @override
  Avatar fromJson(Map<String, dynamic> json) => Avatar.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AvatarToJson(this);

  @override
  List<Object?> get props => [gravatar, tmdb];

  Avatar copyWith({
    Gravatar? gravatar,
    Tmdb? tmdb,
  }) {
    return Avatar(
      gravatar: gravatar ?? this.gravatar,
      tmdb: tmdb ?? this.tmdb,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class Gravatar extends INetworkModel<Gravatar> with EquatableMixin {
  Gravatar({
    this.hash,
  });

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
  final String? hash;

  @override
  Gravatar fromJson(Map<String, dynamic> json) => Gravatar.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$GravatarToJson(this);

  @override
  List<Object?> get props => [hash];

  Gravatar copyWith({
    String? hash,
  }) {
    return Gravatar(
      hash: hash ?? this.hash,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class Tmdb extends INetworkModel<Tmdb> with EquatableMixin {
  Tmdb({
    this.avatarPath,
  });

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);
  final String? avatarPath;

  @override
  Tmdb fromJson(Map<String, dynamic> json) => Tmdb.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TmdbToJson(this);

  @override
  List<Object?> get props => [avatarPath];

  Tmdb copyWith({
    String? avatarPath,
  }) {
    return Tmdb(
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
