part of '../view/sign_up_view.dart';

final class SignUpComponents extends StatelessWidget {
  const SignUpComponents({
    required this.buttonOnPressed,
    required this.emailController,
    required this.passwordController,
    required this.obscureText,
    super.key,
    this.suffixIcon,
  });
  final VoidCallback buttonOnPressed;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.auth_signUp,
            style: ProductStyles.instance.appTitle,
          ).tr(),
          const SizedBox(
            height: WidgetSizes.spacingHundred,
          ),
          CustomTextField(
            controller: emailController,
            keyboardType: TextInputType.text,
            labelText: LocaleKeys.auth_email,
          ),
          Padding(
            padding: const PagePadding.horizontal24Symmetric(),
            child: CustomTextField(
              suffixIcon: suffixIcon,
              obscureText: obscureText,
              controller: passwordController,
              keyboardType: TextInputType.text,
              labelText: LocaleKeys.auth_password,
            ),
          ),
          CustomElevatedButton(
            buttonText: LocaleKeys.auth_signUp,
            backgroundColor: ProductColors.purple,
            onPressed: buttonOnPressed,
            buttonTextStyle: ProductStyles.instance.authButton,
          ),
          TextButton(
            onPressed: () {
              context.router.replace(const LogInRoute());
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
      ),
    );
  }
}
