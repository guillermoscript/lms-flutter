import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_flutter/providers/session_providers.dart';
import 'package:lms_flutter/screens/dashboard/teacher_dashboard.dart';
import 'package:lms_flutter/widgets/app_drawer.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({super.key});

  Widget dashboardByRole(String userRole) {
    switch (userRole) {
      case 'student':
        return const Text('Student Dashboard');
      case 'teacher':
        return const TeacherDashboard();
      case 'admin':
        return const Text('Admin Dashboard');
      default:
        return const Text('Dashboard');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRole = ref.watch(userRoleProvider);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: dashboardByRole(userRole),
    );
  }
}
