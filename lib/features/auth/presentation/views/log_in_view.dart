import 'package:flutter/material.dart';

import 'widgets/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LogInViewBody(),
      ),
    );
  }
}
