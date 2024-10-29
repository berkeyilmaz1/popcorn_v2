import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'request_token_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class RequestToken extends INetworkModel<RequestToken>
    with EquatableMixin {
  RequestToken({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  factory RequestToken.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenFromJson(json);
  final bool? success;
  final String? expiresAt;
  final String? requestToken;

  @override
  RequestToken fromJson(Map<String, dynamic> json) =>
      RequestToken.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$RequestTokenToJson(this);

  @override
  List<Object?> get props => [success, expiresAt, requestToken];

  RequestToken copyWith({
    bool? success,
    String? expiresAt,
    String? requestToken,
  }) {
    return RequestToken(
      success: success ?? this.success,
      expiresAt: expiresAt ?? this.expiresAt,
      requestToken: requestToken ?? this.requestToken,
    );
  }
}
