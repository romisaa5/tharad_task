import 'package:tharad/core/common/widgets/app_button.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/common/widgets/app_input.dart';
import 'package:tharad/core/helpers/app_navigator.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad/core/utils/common_imports.dart';
import 'package:tharad/views/auth/login.dart';
import 'package:tharad/views/auth/widgets/custom_label_text.dart';
import 'package:tharad/views/auth/widgets/upload_image.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            40.h.ph,
            Align(
              alignment: Alignment.center,
              child: Text(
                'إنشاء حساب جديد',
                style: AppTextStyles.font20Bold.copyWith(
                  color: LightAppColors.grey900,
                ),
              ),
            ),
            24.h.ph,
            CustomLabelText(text: 'الصورة الشخصية'),
            UploadImage(onImageSelected: (String? p1) {}),
            CustomLabelText(text: 'اسم المستخدم'),
            AppInput(hintText: 'أدخل اسم المستخدم'),
            CustomLabelText(text: 'البريد الإلكتروني'),
            AppInput(
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomLabelText(text: 'كلمة المرور'),
            AppInput(hintText: 'أدخل كلمة المرور', isObscureText: true),
            CustomLabelText(text: 'تأكيد كلمة المرور'),
            AppInput(hintText: 'أدخل تأكيد كلمة المرور', isObscureText: true),
            40.h.ph,
            AppButton(text: 'إنشاء حساب جديد', onTap: () {}),
            12.h.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لديك حساب بالفعل؟',
                  style: AppTextStyles.font12Regular.copyWith(
                    color: LightAppColors.grey900,
                  ),
                ),
                4.w.pw,
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(LoginView());
                  },
                  child: Text(
                    'تسجيل الدخول',
                    style: AppTextStyles.font12SemiBold.copyWith(
                      color: LightAppColors.primary700,
                    ),
                  ),
                ),
              ],
            ),
            10.h.ph,
          ],
        ),
      ),
    );
  }
}
