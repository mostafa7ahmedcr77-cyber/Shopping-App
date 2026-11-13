import 'package:flutter/material.dart';

import 'package:shopping_app/features/auth/presentation/view/screens/splash_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/onboarding_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/register_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/forgot_password_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/otp_screen.dart';
import 'package:shopping_app/features/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:shopping_app/features/home/presentation/view/screens/home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String resetPassword = '/reset-password';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => const OnboardingScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    otp: (context) => const OtpScreen(),
    resetPassword: (context) => const ResetPasswordScreen(),
    home: (context) => const HomeScreen(),
  };
}
