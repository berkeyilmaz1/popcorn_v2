import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'watchlist_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class WatchlistRequest extends INetworkModel<WatchlistRequest>
    with EquatableMixin {
  WatchlistRequest({
    this.mediaType,
    this.mediaId,
    this.watchlist,
  });

  factory WatchlistRequest.fromJson(Map<String, dynamic> json) =>
      _$WatchlistRequestFromJson(json);
  final String? mediaType;
  final int? mediaId;
  final bool? watchlist;

  @override
  WatchlistRequest fromJson(Map<String, dynamic> json) =>
      WatchlistRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WatchlistRequestToJson(this);

  @override
  List<Object?> get props => [mediaType, mediaId, watchlist];

  WatchlistRequest copyWith({
    String? mediaType,
    int? mediaId,
    bool? watchlist,
  }) {
    return WatchlistRequest(
      mediaType: mediaType ?? this.mediaType,
      mediaId: mediaId ?? this.mediaId,
      watchlist: watchlist ?? this.watchlist,
    );
  }
}
