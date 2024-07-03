import 'package:flutter/material.dart';

class ChattingScreen extends StatelessWidget {
  ChattingScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              // This is just a placeholder for chat messages
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('사용자1'),
                  subtitle: Text('안녕하세요!'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: '메시지 입력...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Implement sending message
                    print('Message sent: ${_controller.text}');
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
