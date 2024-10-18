import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/log_in/view/log_in_view.dart';
import 'package:popcorn_v2/features/home/tab/tab_view.dart';
import 'package:popcorn_v2/product/initialize/service/auth_service.dart';

mixin LogInViewMixin on State<LogInView> {
  late final AuthService _authService;
  AuthService get authService => _authService;

  late final TextEditingController _emailController;
  TextEditingController get emailController => _emailController;
  late final TextEditingController _passwordController;
  TextEditingController get passwordController => _passwordController;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    setupControllers();
  }
///FİX THİS
  Future<void> logIn(String email, String password) async {
    try {
      final userCredential =
          await _authService.logInWithEmailAndPassword(email, password);
      if (!userCredential) return;
      await _navigateToHome();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _navigateToHome() async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<TabView>(
        builder: (context) => const TabView(),
      ),
      (route) => false,
    );
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
