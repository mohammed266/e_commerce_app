import 'package:flutter/material.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(child: Text('MainHomeView'),)
      ),
    );
  }
}
