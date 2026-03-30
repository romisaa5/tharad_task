import 'package:tharad/core/common/widgets/app_button.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/common/widgets/app_input.dart';
import 'package:tharad/core/helpers/app_navigator.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad/core/utils/common_imports.dart';
import 'package:tharad/views/auth/verify_otp.dart';
import 'package:tharad/views/auth/widgets/custom_label_text.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.h.ph,
            Align(
              alignment: Alignment.center,
              child: AppImages(
                imagePath: 'app_logo.png',
                height: 60.h,
                width: 180.w,
              ),
            ),
            100.h.ph,
            Align(
              alignment: Alignment.center,
              child: Text(
                'هل نسيت كلمة المرور؟',
                style: AppTextStyles.font20Bold.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
            ),
            12.h.ph,
            CustomLabelText(text: 'البريد الإلكتروني'),
            AppInput(
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            40.h.ph,
            AppButton(
              text: 'المتابعة',
              onTap: () {
                AppNavigator.push(VerifyOtp());
              },
            ),
          ],
        ),
      ),
    );
  }
}
