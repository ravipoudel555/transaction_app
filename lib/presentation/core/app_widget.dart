import 'package:centralized_transaction/controllers/sign_in/sign_in_binding.dart';
import 'package:centralized_transaction/controllers/sign_up/sign_up_binding.dart';
import 'package:centralized_transaction/controllers/transaction/transaction_binding.dart';
import 'package:centralized_transaction/presentation/dashboard/dashboard.dart';
import 'package:centralized_transaction/presentation/sign_in/sign_in_page.dart';
import 'package:centralized_transaction/presentation/sign_up/sign_up_page.dart';
import 'package:centralized_transaction/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Centralized_Transaction',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
        accentColor: Colors.blue,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: '/signin',
          page: () => SignInPage(),
          binding: SignInBinding(),
        ),
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => Dashboard(),
          binding: TransactionBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
          binding: SignUpBinding(),
        ),
      ],
    );
  }
}
