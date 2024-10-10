import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'videos_model.g.dart';

@JsonSerializable()
final class Videos extends INetworkModel<Videos> with EquatableMixin {
  Videos({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final double? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String? id;

  @override
  Videos fromJson(Map<String, dynamic> json) => Videos.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$VideosToJson(this);

  @override
  List<Object?> get props => [
        iso6391,
        iso31661,
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
        id,
      ];

  Videos copyWith({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    double? size,
    String? type,
    bool? official,
    String? publishedAt,
    String? id,
  }) {
    return Videos(
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }
}
