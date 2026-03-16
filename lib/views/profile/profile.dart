import 'package:tharad/core/common/widgets/app_button.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/common/widgets/app_input.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad/core/utils/common_imports.dart';
import 'package:tharad/views/auth/widgets/custom_label_text.dart';
import 'package:tharad/views/auth/widgets/upload_image.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  bool isObscureOldPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: LightAppColors.greenGradient),
        ),
        child: Column(
          children: [
            20.h.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppImages(imagePath: 'language.svg'),
                  Text(
                    'الملف الشخصي',
                    style: TextStyle(
                      color: LightAppColors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppImages(imagePath: 'notification.svg'),
                ],
              ),
            ),
            24.h.ph,
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LightAppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabelText(text: 'اسم المستخدم'),
                        AppInput(hintText: 'أدخل اسم المستخدم'),
                        CustomLabelText(text: 'البريد الإلكتروني'),
                        AppInput(
                          hintText: 'أدخل البريد الإلكتروني',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomLabelText(text: 'الصورة الشخصية'),
                        UploadImage(onImageSelected: (String? p1) {}),
                        CustomLabelText(text: 'كلمة المرور القديمة'),
                        AppInput(
                          hintText: ' أدخل كلمة المرور القديمة',
                          isObscureText: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureOldPassword = !isObscureOldPassword;
                              });
                            },
                            icon: Icon(
                              isObscureOldPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: LightAppColors.grey600,
                            ),
                          ),
                        ),
                        CustomLabelText(text: 'كلمة المرور الجديدة'),
                        AppInput(
                          hintText: 'أدخل كلمة المرور الجديدة',
                          isObscureText: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscurePassword = !isObscurePassword;
                              });
                            },
                            icon: Icon(
                              isObscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: LightAppColors.grey600,
                            ),
                          ),
                        ),
                        CustomLabelText(text: 'تأكيد كلمة المرور الجديدة'),
                        AppInput(
                          hintText: 'أدخل تأكيد كلمة المرور الجديدة',
                          isObscureText: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureConfirmPassword =
                                    !isObscureConfirmPassword;
                              });
                            },
                            icon: Icon(
                              isObscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: LightAppColors.grey600,
                            ),
                          ),
                        ),
                        40.h.ph,
                        Center(
                          child: AppButton(text: 'حفظ التغيرات', width: 235.w),
                        ),
                        12.h.ph,
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'تسجيل الخروج',
                              style: AppTextStyles.font14SemiBold.copyWith(
                                color: LightAppColors.error500,
                                decoration: TextDecoration.underline,
                                decorationColor: LightAppColors.error500,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
