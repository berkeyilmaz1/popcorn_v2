import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/reset_password/view/reset_password_view.dart';
import 'package:popcorn_v2/product/initialize/service/auth_service.dart';

mixin ResetPasswordMixin on State<ResetPasswordView> {
  late final TextEditingController emailController;
  late final AuthService _authService;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    _authService = AuthService();
  }

  Future<void> resetButtonPressed(String email) async {
    await _authService.resetPassword(email); 
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
