part of '../view/verification_view.dart';

final class VerificationComponents extends StatelessWidget {
  const VerificationComponents({
    required this.onPressed,
    super.key,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.auth_verification,
          style: ProductStyles.instance.appTitle,
        ).tr(),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('go'),
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
