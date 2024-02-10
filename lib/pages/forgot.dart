import 'package:flutter/material.dart';

class MyForget extends StatefulWidget {
  const MyForget({super.key});

  @override
  State<MyForget> createState() => _MyForgetState();
}

class _MyForgetState extends State<MyForget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
    );
  }
}
