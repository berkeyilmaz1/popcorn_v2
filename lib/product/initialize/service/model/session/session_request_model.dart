import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'session_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class SessionRequest extends INetworkModel<SessionRequest>
    with EquatableMixin {
  SessionRequest({
    this.requestToken,
  });

  factory SessionRequest.fromJson(Map<String, dynamic> json) =>
      _$SessionRequestFromJson(json);
  final String? requestToken;

  @override
  SessionRequest fromJson(Map<String, dynamic> json) =>
      SessionRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SessionRequestToJson(this);

  @override
  List<Object?> get props => [requestToken];

  SessionRequest copyWith({
    String? requestToken,
  }) {
    return SessionRequest(
      requestToken: requestToken ?? this.requestToken,
    );
  }
}
