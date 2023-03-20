import 'package:e_commerce_app/blocs/app_bloc/app_bloc.dart';
import 'package:e_commerce_app/controller/screen_controller.dart';
import 'package:e_commerce_app/core/routes.dart';
import 'package:e_commerce_app/core/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => BlocProvider(
        create: (context) => AppBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce',
          theme: theme.getTheme(),
          routes: routes,
          initialRoute: ScreenController.route,
          // home: const ScreenController(),
        ),
      ),
    );
  }
}
