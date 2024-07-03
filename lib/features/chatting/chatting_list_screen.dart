import 'package:flutter/material.dart';

class ChattingListScreen extends StatelessWidget {
  const ChattingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('사용자1'),
                subtitle: Text('안녕하세요!'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
