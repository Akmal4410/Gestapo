import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestapo/application/navigation_screen/navigation_screen_bloc.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/admin/admin_navigation_screen/admin_navigation_screen.dart';
import 'package:gestapo/presentations/intro_screen/spalsh_screen_one.dart';
import 'package:gestapo/presentations/user/user_navigation_screen/user_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationScreenBloc()),
      ],
      child: MaterialApp(
        title: 'Gestapo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: kWhite,
              fontFamily: 'Poppins',
            ),
            subtitle1: TextStyle(
              color: kWhite,
              fontFamily: 'Poppins',
            ),
            caption: TextStyle(
              color: kWhite,
              fontFamily: 'Poppins',
            ),
            headline6: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
        home: const UserNavigationScreen(),
        // home: SplashScreenOne(),
        // home: AdminNavigationScreen(),
      ),
    );
  }
}
