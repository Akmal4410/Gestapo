import 'package:gestapo/presentations/intro_screen/intro_screen.dart';
import 'package:gestapo/presentations/intro_screen/spalsh_screen_one.dart';
import 'package:gestapo/presentations/intro_screen/splach_screen_two.dart';
import 'package:gestapo/presentations/login/forget_password_screen/forget_password_screen.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static final List<GetPage> getPages = [
    GetPage(
      name: SplashScreenOne.path,
      page: () => const SplashScreenOne(),
    ),
    GetPage(
      name: SplashScreenTwo.path,
      page: () => const SplashScreenTwo(),
    ),
    GetPage(
      name: IntroScreen.path,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: LoginScreen.path,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: SignInScreen.path,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: SignUpScreen.path,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: ForgetPasswordScreen.path,
      page: () => const ForgetPasswordScreen(),
    ),
  ];
}
