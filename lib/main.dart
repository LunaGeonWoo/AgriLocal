import 'package:agrilocal/features/authentication/log_in_screen.dart';
import 'package:agrilocal/features/home/home_screen.dart';
import 'package:agrilocal/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AgriLocal());
}

class AgriLocal extends StatelessWidget {
  const AgriLocal({super.key});

  Future<Widget> _getInitialScreen() async {
    if (await ApiService().postRefreshToken()) {
      return const HomeScreen();
    } else {
      return const LogInScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArgilLocal',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FutureBuilder<Widget>(
        future: _getInitialScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ?? const LogInScreen();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
