import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'session_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class SessionResponse extends INetworkModel<SessionResponse>
    with EquatableMixin {
  SessionResponse({
    this.success,
    this.sessionId,
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);
  final bool? success;

  final String? sessionId;

  @override
  SessionResponse fromJson(Map<String, dynamic> json) =>
      SessionResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SessionResponseToJson(this);

  @override
  List<Object?> get props => [success, sessionId];

  SessionResponse copyWith({
    bool? success,
    bool? failure,
    int? statusCode,
    String? sessionId,
  }) {
    return SessionResponse(
      success: success ?? this.success,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
