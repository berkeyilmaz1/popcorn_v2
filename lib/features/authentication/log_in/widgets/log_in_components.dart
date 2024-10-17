part of '../view/log_in_view.dart';

final class LogInComponents extends StatelessWidget {
  const LogInComponents({
    super.key,
  });

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
        const CustomTextField(
          keyboardType: TextInputType.text,
          labelText: LocaleKeys.auth_email,
        ),
        const CustomTextField(
          keyboardType: TextInputType.text,
          labelText: LocaleKeys.auth_password,
        ),
        CustomElevatedButton(
          buttonText: LocaleKeys.auth_logIn,
          backgroundColor: ProductColors.purple,
          onPressed: () {},
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
