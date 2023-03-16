import 'package:e_commerce_app/core/routes.dart';
import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:e_commerce_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
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
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: theme.getTheme(),
        routes: routes,
        initialRoute: HomeScreen.route,
      ),
    );
  }
}
