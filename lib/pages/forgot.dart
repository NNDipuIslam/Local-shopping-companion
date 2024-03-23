import 'package:flutter/material.dart';

class MyForget extends StatefulWidget {
  @override
  State<MyForget> createState() => _MyForgetState();
}

class _MyForgetState extends State<MyForget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: ForgotPasswordBody(),
    );
  }
}

class ForgotPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Forgot Your Password?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Enter your email address below and we\'ll send you a link to reset your password.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // ekhane forget pass er logic implement korte hobe
            },
            child: Text('Reset Password'),
          ),
        ],
      ),
    );
  }
}
