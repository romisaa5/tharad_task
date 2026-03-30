import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad/core/helpers/app_navigator.dart';
import 'package:tharad/core/theme/app_colors/light_theme_data.dart';
import 'package:tharad/views/auth/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          home: const RegisterView(),
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(context),
        );
      },
    );
  }
}
