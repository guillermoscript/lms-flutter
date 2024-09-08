import 'package:flutter/material.dart';
import 'package:lms_flutter/app.dart';
import 'package:lms_flutter/env/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
