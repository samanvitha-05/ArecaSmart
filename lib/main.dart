import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const ArecaSmartApp());
}

class ArecaSmartApp extends StatelessWidget {
  const ArecaSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArecaSmart',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF6F8F4),
      ),
      home: const DashboardScreen(),
    );
  }
}