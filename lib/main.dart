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
        future: _getInitialScreen(), // 초기 화면 결정 로직을 FutureBuilder로 감싸기
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ??
                const LogInScreen(); // 데이터가 있으면 해당 화면을, 없으면 LogInScreen을 반환
          } else {
            return const CircularProgressIndicator(); // 로딩 중에는 로딩 인디케이터 표시
          }
        },
      ),
    );
  }
}
