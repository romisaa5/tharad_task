import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
    this.width,
    this.textcolor,
    this.isborder = true,
    this.isIcon = false,
    this.hight,
    this.style,
    this.border,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.isLoading = false,
  });

  final String text;
  final Color? textcolor;
  final Color? color;
  final double? width;
  final void Function()? onTap;
  final bool isborder;
  final bool isIcon;
  final double? hight;
  final TextStyle? style;
  final double? border;
  final String? icon;
  final ColorFilter? iconColor;
  final Color? borderColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? double.infinity,
        height: hight ?? 65.h,
        decoration: BoxDecoration(
          border: isborder
              ? Border.all(color: borderColor ?? LightAppColors.primary50)
              : null,
          borderRadius: BorderRadius.circular(border ?? 8.r),
          gradient: color != null
              ? null
              : LinearGradient(colors: LightAppColors.greenGradient),
          color: color,
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: CircularProgressIndicator(
                    color: textcolor ?? Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isIcon == true) ...[
                    AppImages(imagePath: icon!, colorFilter: iconColor),
                    8.w.pw,
                  ],
                  Text(
                    text,
                    style:
                        style ??
                        AppTextStyles.font14Bold.copyWith(
                          color: textcolor ?? Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
