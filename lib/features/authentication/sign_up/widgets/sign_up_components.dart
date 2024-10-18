part of '../view/sign_up_view.dart';

final class SignUpComponents extends StatelessWidget {
  const SignUpComponents({
    required this.buttonOnPressed,
    required this.emailController,
    required this.passwordController,
    super.key,
  });
  final VoidCallback buttonOnPressed;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.auth_signUp,
          style: ProductStyles.instance.appTitle,
        ).tr(),
        const SizedBox(
          height: WidgetSizes.spacingXxl12,
        ),
        CustomTextField(
          controller: emailController,
          keyboardType: TextInputType.text,
          labelText: LocaleKeys.auth_email,
        ),
        CustomTextField(
          controller: passwordController,
          keyboardType: TextInputType.text,
          labelText: LocaleKeys.auth_password,
        ),
        CustomElevatedButton(
          buttonText: LocaleKeys.auth_signUp,
          backgroundColor: ProductColors.purple,
          onPressed: buttonOnPressed,
          buttonTextStyle: ProductStyles.instance.authButton,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<LogInView>(
                builder: (context) => const LogInView(),
              ),
            );
          },
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.auth_haveAnAcc.tr(),
              style: ProductStyles.instance.haveAnAcc,
              children: <TextSpan>[
                TextSpan(
                  text: LocaleKeys.auth_logIn.tr(),
                  style: ProductStyles.instance.haveAnAcc.copyWith(
                    color: ProductColors.purple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
