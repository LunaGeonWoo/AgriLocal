import 'package:agrilocal/features/chatting/chatting_screen.dart';
import 'package:flutter/material.dart';

class ChattingListScreen extends StatelessWidget {
  const ChattingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChattingScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('김농부'),
                  subtitle: Text('안녕하세요!'),
                  trailing: Text("30분 전"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
