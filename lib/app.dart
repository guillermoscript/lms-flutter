import 'package:flutter/material.dart';
import 'package:lms_flutter/screens/dashboard/dashboard.dart';
import 'package:lms_flutter/screens/login/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class App extends StatelessWidget {
  App({super.key});

  final currentSession = Supabase.instance.client.auth.currentSession;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: currentSession == null ? const Login() : const Dashboard(),
    );
  }
}
