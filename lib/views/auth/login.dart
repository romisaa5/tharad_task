import 'package:flutter/cupertino.dart';
import 'package:tharad/core/common/widgets/app_button.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/common/widgets/app_input.dart';
import 'package:tharad/core/helpers/app_navigator.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad/core/utils/common_imports.dart';
import 'package:tharad/views/auth/forget_password.dart';
import 'package:tharad/views/auth/register.dart';
import 'package:tharad/views/auth/widgets/custom_label_text.dart';
import 'package:tharad/views/profile/profile.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscurePassword = true;
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
            CustomLabelText(text: 'البريد الإلكتروني'),
            AppInput(
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomLabelText(text: 'كلمة المرور'),
            AppInput(
              hintText: 'أدخل كلمة المرور',
              isObscureText: true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                },
                icon: Icon(
                  isObscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: LightAppColors.grey600,
                ),
              ),
            ),

            10.h.ph,
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => AppNavigator.push(context, ForgetPasswordView()),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: AppTextStyles.font12Regular.copyWith(
                    color: LightAppColors.primary700,
                  ),
                ),
              ),
            ),
            40.h.ph,
            AppButton(
              text: 'تسجيل الدخول',
              onTap: () {
                AppNavigator.pushAndRemoveUntil(context, ProfileView());
              },
            ),
            12.h.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ليس لديك حساب؟',
                  style: AppTextStyles.font12Regular.copyWith(
                    color: LightAppColors.grey600,
                  ),
                ),
                4.w.pw,
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(context, RegisterView());
                  },
                  child: Text(
                    'إنشاء حساب جديد',
                    style: AppTextStyles.font12SemiBold.copyWith(
                      color: LightAppColors.primary700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
