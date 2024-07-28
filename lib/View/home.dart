import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeView extends StatelessWidget {
  final storage = const FlutterSecureStorage();

  Future<void> logout(BuildContext context) async {
    await storage.delete(key: 'token');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen'),
      ),
    );
  }
}
