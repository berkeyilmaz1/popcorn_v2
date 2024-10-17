part of '../view/sign_up_view.dart';

final class SignUpComponents extends StatelessWidget {
  const SignUpComponents({
    super.key,
  });

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
        const CustomTextField(
          keyboardType: TextInputType.text,
          labelText: LocaleKeys.auth_email,
        ),
        const CustomTextField(
          keyboardType: TextInputType.text,
          labelText: LocaleKeys.auth_password,
        ),
        CustomElevatedButton(
          buttonText: LocaleKeys.auth_signUp,
          backgroundColor: ProductColors.purple,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<VerificationView>(
                builder: (context) => const VerificationView(),
              ),
            );
          },
          buttonTextStyle: ProductStyles.instance.authButton,
        ),
        TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.auth_haveAnAcc.tr(),
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
