import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:popcorn_v2/product/initialize/service/model/cast/cast_model.dart';
import 'package:vexana/vexana.dart';

part 'cast_list.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
final class CastList extends INetworkModel<CastList> with EquatableMixin {
  CastList({
    this.id,
    this.cast,
  });

  factory CastList.fromJson(Map<String, dynamic> json) =>
      _$CastListFromJson(json);
  final int? id;
  final List<Cast>? cast;

  @override
  CastList fromJson(Map<String, dynamic> json) => CastList.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CastListToJson(this);

  @override
  List<Object?> get props => [id, cast];

  CastList copyWith({
    int? id,
    List<Cast>? cast,
  }) {
    return CastList(
      id: id ?? this.id,
      cast: cast ?? this.cast,
    );
  }
}
