import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/verification_view.dart';
import 'package:popcorn_v2/product/initialize/service/auth_service.dart';

mixin VerificationViewMixin on State<VerificationView> {
  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    checkUserVerified();
  }

  Future<bool> checkUserVerified() async {
    final isVerified = await _authService.checkEmailVerified();
    return isVerified;
  }
}
