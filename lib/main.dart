import 'package:flutter/material.dart';
import 'screens/landing_screen.dart'; // Import màn hình bạn vừa tạo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extra Efficient',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LandingScreen(), // Đặt LandingScreen làm trang chủ khởi đầu trước khi login
    );
  }
}