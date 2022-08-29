import 'package:flutter/material.dart';
import 'package:upstrivia/screen/screens.dart';


class AppRoutes {

  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'Login': (BuildContext context) => const LoginScreen(),
    'HomePage': (BuildContext context) => const HomePage(),
    'Register': (BuildContext context) => const RegisterScreen(),
    'QuestionPage': (BuildContext context) => const QuestionScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const LoginScreen()
    );
  }

}