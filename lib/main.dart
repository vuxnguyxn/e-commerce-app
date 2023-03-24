import 'package:e_commerce_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:e_commerce_app/blocs/update_profile_bloc/update_profile_bloc.dart';
import 'package:e_commerce_app/core/routes.dart';
import 'package:e_commerce_app/core/themes.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/sign_up_bloc/sign_up_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => SignInBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) =>
              UpdateProfileBloc(authRepository: authRepository),
        ),
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce',
          theme: theme.getTheme(),
          routes: routes,
          initialRoute: SplashScreen.route,
          // home: const ScreenController(),
        ),
      ),
    );
  }
}
