import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/core.dart';
import 'utils/utils.dart';

export 'core/core.dart';
export 'views/view.dart';
export 'res/res.dart';
export 'controller/controller.dart';
export 'models/models.dart';
export 'repository/repository.dart';
export 'view_model/view_model.dart';
export 'shared/widgets/widgets.dart';
export 'utils/utils.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: TranslationFile(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          initialRoute: AppRoutes.home,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
