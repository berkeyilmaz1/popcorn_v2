import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'fav_and_watchlist_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class FavAndWatchlistResponse
    extends INetworkModel<FavAndWatchlistResponse> with EquatableMixin {
  FavAndWatchlistResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  factory FavAndWatchlistResponse.fromJson(Map<String, dynamic> json) =>
      _$FavAndWatchlistResponseFromJson(json);
  final bool? success;
  final int? statusCode;
  final String? statusMessage;

  @override
  FavAndWatchlistResponse fromJson(Map<String, dynamic> json) =>
      FavAndWatchlistResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FavAndWatchlistResponseToJson(this);

  @override
  List<Object?> get props => [success, statusCode, statusMessage];

  FavAndWatchlistResponse copyWith({
    bool? success,
    int? statusCode,
    String? statusMessage,
  }) {
    return FavAndWatchlistResponse(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}
