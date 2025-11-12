import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_root.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashToHomeRoot(),
    );
  }
}

class SplashToHomeRoot extends StatefulWidget {
  const SplashToHomeRoot({Key? key}) : super(key: key);

  @override
  State<SplashToHomeRoot> createState() => _SplashToHomeRootState();
}

class _SplashToHomeRootState extends State<SplashToHomeRoot> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeRoot()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
