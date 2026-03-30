import 'package:tharad/core/common/widgets/app_button.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/helpers/app_navigator.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad/core/utils/common_imports.dart';
import 'package:tharad/views/auth/login.dart';
import 'package:tharad/views/auth/widgets/otp_field.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
                'إنشاء حساب جديد',
                style: AppTextStyles.font20Bold.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
            ),
            12.h.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                ' لاستكمال فتح حسابك ادخل رمز التحقق المرسل عبر البريد الإلكتروني',
                style: AppTextStyles.font12SemiBold.copyWith(
                  color: LightAppColors.grey600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            40.h.ph,
            OtpField(onCompleted: (val) {}),
            40.h.ph,
            AppButton(
              text: 'المتابعة',
              onTap: () {
                AppNavigator.pushAndRemoveUntil(LoginView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
