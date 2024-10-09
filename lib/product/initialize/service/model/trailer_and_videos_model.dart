import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:popcorn_v2/product/initialize/service/model/videos_model.dart';
import 'package:vexana/vexana.dart';

part 'trailer_and_videos_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class TrailerAndVideos extends INetworkModel<TrailerAndVideos>
    with EquatableMixin {
  TrailerAndVideos({
    this.id,
    this.results,
  });

  factory TrailerAndVideos.fromJson(Map<String, dynamic> json) =>
      _$TrailerAndVideosFromJson(json);
  final int? id;
  final List<Videos>? results;

  @override
  TrailerAndVideos fromJson(Map<String, dynamic> json) =>
      TrailerAndVideos.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TrailerAndVideosToJson(this);

  @override
  List<Object?> get props => [id, results];

  TrailerAndVideos copyWith({
    int? id,
    List<Videos>? results,
  }) {
    return TrailerAndVideos(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }
}
