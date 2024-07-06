import 'package:agrilocal/main.dart';
import 'package:agrilocal/services/api_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void onPressed(context) async {
    if (await ApiService().logout()) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AgriLocal()),
        (Route<dynamic> route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('로그아웃에 실패했습니다.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 10.0),
          const Text(
            '사용자 이름',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '이메일@example.com',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          const Text(
            '주소',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          ElevatedButton(
            onPressed: () => onPressed(context),
            child: const Text("로그아웃하기"),
          )
        ],
      ),
    );
  }
}
