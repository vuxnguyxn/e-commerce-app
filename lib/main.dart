import 'package:e_commerce_app/core/routes.dart';
import 'package:e_commerce_app/features/profile/presentation/blocs/switch_bloc/switch_bloc.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:e_commerce_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce',
            theme: state.switchValue
                ? darkThemeData(context)
                : lightThemeData(context),
            routes: routes,
            initialRoute: SplashScreen.route,
          );
        },
      ),
    );
  }
}
