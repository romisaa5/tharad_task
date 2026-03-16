import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tharad/core/common/widgets/app_images.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad/core/utils/common_imports.dart';
import 'package:tharad/views/auth/widgets/bottom_sheet_option_tile.dart';
import 'package:tharad/views/auth/widgets/custom_bottom_sheet.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.onImageSelected});
  final Function(String?) onImageSelected;
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? selectedImage;
  bool _isPickingImage = false;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    if (_isPickingImage) return;

    _isPickingImage = true;

    try {
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (image != null) {
        final file = File(image.path);

        if (!mounted) return;

        setState(() {
          selectedImage = file;
        });

        widget.onImageSelected(image.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _isPickingImage = false;

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  void _showImagePickerSheet() {
    final options = [
      BottomSheetOptionTile(
        icon: 'camera.svg',
        title: 'التقاط الصورة',
        onTap: () => _pickImage(ImageSource.camera),
      ),
      BottomSheetOptionTile(
        icon: 'gallery-add.svg',
        title: 'اختر صورة موجودة',
        onTap: () => _pickImage(ImageSource.gallery),
      ),
      if (selectedImage != null)
        BottomSheetOptionTile(
          icon: 'trash.svg',
          title: 'حذف الصورة',
          isDestructive: true,
          onTap: () {
            setState(() => selectedImage = null);
            widget.onImageSelected(null);
            Navigator.pop(context);
          },
        ),
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomBottomSheet(
          title: 'الصورة الشخصية',
          children: [
            for (int i = 0; i < options.length; i++)
              FadeInUp(
                duration: Duration(milliseconds: 400 + i * 150),
                child: options[i],
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: _showImagePickerSheet,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          padding: EdgeInsets.zero,
          color: LightAppColors.primary700,
          strokeWidth: 1,
          dashPattern: [10, 10],
          radius: Radius.circular(12.r),
        ),
        child: Container(
          height: 87.h,
          width: double.infinity,
          alignment: Alignment.center,
          child: selectedImage == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImages(
                      imagePath: 'camera.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                    6.h.ph,
                    Text(
                      'الملفات المسموح بها: JPEG, PNG\nحد أقصى: 5MB',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: LightAppColors.grey600,
                        fontSize: 8.sp,
                      ),
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    selectedImage!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
