import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/common/widgets/app_input.dart';
import 'package:tharad/core/helpers/extensions.dart';
import 'package:tharad/core/theme/app_colors/light_app_colors.dart';
import 'package:tharad/core/theme/app_texts/app_text_styles.dart';

class OtpField extends StatefulWidget {
  final int length;
  final void Function(String) onCompleted;

  const OtpField({super.key, this.length = 4, required this.onCompleted});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  Timer? _timer;
  int _seconds = 60;
  bool canResend = false;
  bool isResending = false;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _seconds = 60;
    canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        setState(() {
          canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1 && index < widget.length - 1) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    String code = controllers.map((e) => e.text).join();
    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    String minutesStr = (_seconds ~/ 60).toString().padLeft(1, '0');
    String secondsStr = (_seconds % 60).toString().padLeft(2, '0');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.length, (index) {
            return Container(
              width: 60.w,
              height: 65.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: AppInput(
                backgroundColor: Colors.white,
                controller: controllers[index],
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) => _onChanged(index, value),
              ),
            );
          }),
        ),
        10.h.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " لم يصلك رمز ؟",
              style: AppTextStyles.font12Regular.copyWith(
                color: LightAppColors.grey600,
              ),
            ),
            GestureDetector(
              onTap: canResend && !isResending ? null : null,
              child: Text(
                isResending ? "يتم  إعادة ارسال" : "  إعادة ارسال",
                style: AppTextStyles.font12Regular.copyWith(
                  color: canResend && !isResending
                      ? LightAppColors.primary700
                      : LightAppColors.grey500,
                ),
              ),
            ),
            10.w.pw,
            Text(
              "$minutesStr:$secondsStr",
              style: AppTextStyles.font12Regular.copyWith(
                color: LightAppColors.grey600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
