import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';

class BottomSheetOptionTile extends StatelessWidget {
  final String icon;
  final String title;
  final Color? iconColor;
  final VoidCallback? onTap;
  final bool isDestructive;

  const BottomSheetOptionTile({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor,
    this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Center(
              child: AppImages(
                imagePath: icon,
                width: 24.w,
                height: 24.h,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : ColorFilter.mode(
                        LightAppColors.primary700,
                        BlendMode.srcIn,
                      ),
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: Text(
                title,
                style: AppTextStyles.font16Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
