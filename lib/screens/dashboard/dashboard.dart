import 'package:flutter/material.dart';
import 'package:lms_flutter/screens/dashboard/courses.dart';
import 'package:lms_flutter/widgets/app_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Courses(),
          ],
        ),
      ),
    );
  }
}
