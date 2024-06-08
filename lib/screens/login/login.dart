import 'package:flutter/material.dart';
import 'package:lms_flutter/screens/login/login_form.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final auth = Supabase.instance.client.auth;

  String? error = '';
  bool loading = false;

  void _onSubmit(String email, String password) async {
    setState(() {
      loading = true;
    });

    auth.signInWithPassword(email: email, password: password).then((value) {
      setState(() {
        loading = false;
      });
    }).catchError((e) {
      setState(() {
        error = e.error.message;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login to your account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Enter your email below to login',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: LoginForm(
                  onSubmit: _onSubmit,
                ),
              ),
              if (error != null && error!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    error!,
                    style: TextStyle(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
