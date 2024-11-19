import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/sign_up_view.dart';
import 'package:popcorn_v2/product/initialize/router/app_router.dart';
import 'package:popcorn_v2/product/initialize/service/auth_service.dart';

mixin SignUpViewMixin on State<SignUpView> {
  late final AuthService _authService;
  AuthService get authService => _authService;

  late final TextEditingController _emailController;
  TextEditingController get emailController => _emailController;
  late final TextEditingController _passwordController;
  TextEditingController get passwordController => _passwordController;
  bool isObscure = true;
  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    setupControllers();
  }

  Future<void> navigateToVerify() async {
    await context.router.replaceAll([const VerificationRoute()]);
  }

  Future<void> signUpAndVerify(String email, String password) async {
    try {
      await _authService.signUpWithEmailAndPassword(email, password);
      await _authService.sendEmailVerification();
      await navigateToVerify();
    } catch (e) {
      print(e);
    }
  }

  void changeObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  void setupControllers() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void disposeControllers() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}
