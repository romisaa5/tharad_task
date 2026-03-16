import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad/core/utils/common_imports.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.h.ph,
        Text(
          text,
          style: AppTextStyles.font12SemiBold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),
        6.h.ph,
      ],
    );
  }
}
