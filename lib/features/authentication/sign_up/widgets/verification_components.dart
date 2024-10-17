part of '../view/verification_view.dart';

final class VerificationComponents extends StatelessWidget {
  const VerificationComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.auth_verification,
          style: ProductStyles.instance.appTitle,
        ).tr(),
        const SizedBox(
          height: WidgetSizes.spacingXxl12,
        ),
        const CustomTextField(
          keyboardType: TextInputType.text,
          labelText: LocaleKeys.auth_verification,
        ),
        CustomElevatedButton(
          buttonText: LocaleKeys.auth_verify,
          backgroundColor: ProductColors.purple,
          onPressed: () {},
          buttonTextStyle: ProductStyles.instance.authButton,
        ),
        TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.auth_didntreceive.tr(),
              style: ProductStyles.instance.haveAnAcc,
              children: <TextSpan>[
                TextSpan(
                  text: LocaleKeys.auth_resendCode.tr(),
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
