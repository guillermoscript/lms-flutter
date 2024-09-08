import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_flutter/utils/session.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userRoleProvider = Provider((_) {
  final currentSession = Supabase.instance.client.auth.currentSession;

  if (currentSession == null) {
    return null;
  }

  final payload = parseJwt(currentSession.accessToken);

  return payload['user_role'];
});
