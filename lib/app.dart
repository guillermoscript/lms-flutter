import 'package:flutter/material.dart';
import 'package:lms_flutter/screens/dashboard/dashboard.dart';
import 'package:lms_flutter/screens/login/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: FutureBuilder(
          future: Supabase.instance.client.auth.getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasData && snapshot.data != null) {
              return const Dashboard();
            }

            return const Login();
          }),
    );
  }
}
