import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skladum/common/app_color.dart';
import 'package:skladum/common/app_text_style.dart';
import 'package:skladum/common/routes.dart';
import 'package:skladum/di/di.dart' as sl;
import 'package:skladum/di/di.dart';
import 'package:skladum/features/home/precentation/bloc/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sl.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ),
  );

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) => runApp(
      EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: const [
          Locale('en'),
          Locale('uz'),
          Locale('ru'),
        ],
        path: 'assets/l10n',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<HomeBloc>()),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) => Routes.generateRoutes(settings),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: AppColors.white,
              iconTheme: IconThemeData(color: AppColors.black),
              titleTextStyle: AppTextStyles.body16w7),
          scaffoldBackgroundColor: AppColors.white,
        ),
        title: 'skladum',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
