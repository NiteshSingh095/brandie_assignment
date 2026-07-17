import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/core.dart';
import 'views/view.dart';

export 'core/core.dart';
export 'views/view.dart';
export 'res/res.dart';
export 'controller/controller.dart';
export 'models/models.dart';
export 'shared/widgets/widgets.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          translations: TranslationFile(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          home: const HomeView(),
        );
      },
    );
  }
}
