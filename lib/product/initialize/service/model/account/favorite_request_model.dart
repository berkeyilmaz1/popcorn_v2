import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'favorite_request_model.g.dart';

@JsonSerializable()
final class FavoriteRequest extends INetworkModel<FavoriteRequest>
    with EquatableMixin {
  FavoriteRequest({
    this.mediaType,
    this.mediaId,
    this.favorite,
  });

  factory FavoriteRequest.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRequestFromJson(json);
  final String? mediaType;
  final int? mediaId;
  final bool? favorite;

  @override
  FavoriteRequest fromJson(Map<String, dynamic> json) =>
      FavoriteRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FavoriteRequestToJson(this);

  @override
  List<Object?> get props => [mediaType, mediaId, favorite];

  FavoriteRequest copyWith({
    String? mediaType,
    int? mediaId,
    bool? favorite,
  }) {
    return FavoriteRequest(
      mediaType: mediaType ?? this.mediaType,
      mediaId: mediaId ?? this.mediaId,
      favorite: favorite ?? this.favorite,
    );
  }
}
