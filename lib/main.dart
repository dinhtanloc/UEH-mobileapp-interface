import 'package:flutter/material.dart';
import 'package:widgetdemo/widgets/dashboard.dart';
import 'widgets/welcome.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => WelcomeScreen(),
      '/dashboard': (context) => DashboardScreen(),
    }
  ));
}

