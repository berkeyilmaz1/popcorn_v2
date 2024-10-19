part of '../view/log_in_view.dart';

final class LogInComponents extends StatelessWidget {
  const LogInComponents({
    required this.emailController,
    required this.passwordController,
    required this.buttonOnPressed,
    super.key,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.auth_logIn,
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
          buttonText: LocaleKeys.auth_logIn,
          backgroundColor: ProductColors.purple,
          onPressed: buttonOnPressed,
          buttonTextStyle: ProductStyles.instance.authButton,
        ),
        TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.auth_dontHaveAnAcc.tr(),
              style: ProductStyles.instance.haveAnAcc,
              children: <TextSpan>[
                TextSpan(
                  text: LocaleKeys.auth_signUp.tr(),
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
