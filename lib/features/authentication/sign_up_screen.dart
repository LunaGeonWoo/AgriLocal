import 'package:agrilocal/features/home/home_screen.dart';
import 'package:agrilocal/services/api_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _idCheckMessage = '';
  bool _idCheck = false;

  bool checkValidEmail() {
    final email = _emailController.text;
    if (!RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email)) {
      return false;
    }
    return true;
  }

  bool checkSamePassword() {
    if (_passwordController.text != _confirmPasswordController.text) {
      return false;
    }
    return true;
  }

  Future<bool> checkId() async {
    final id = _idController.text;
    if (id.isEmpty) {
      setState(() {
        _idCheckMessage = '아이디를 입력해주세요.';
        _idCheck = false;
      });
      return false;
    } else if (await ApiService().checkId(username: id)) {
      setState(() {
        _idCheckMessage = '사용가능한 아이디 입니다.';
        _idCheck = true;
      });
      return true;
    } else {
      setState(() {
        _idCheckMessage = '이미 존재하는 아이디 입니다.';
        _idCheck = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _idController,
                      decoration: const InputDecoration(
                        labelText: '아이디',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await checkId();
                    },
                    child: const Text(
                      "확인",
                    ),
                  )
                ],
              ),
              if (_idCheckMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _idCheckMessage,
                    style: TextStyle(
                      fontSize: 12,
                      color: _idCheck ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '비밀번호 확인',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '이름',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: '주소',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: '이메일',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () async {
            if (!checkValidEmail()) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("오류"),
                  content: Text("유효한 이메일 주소를 입력하세요."),
                ),
              );
              return;
            }
            if (!checkSamePassword()) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("오류"),
                  content: Text("비밀번호가 일치하지 않습니다."),
                ),
              );
              return;
            }
            if (!_idCheck) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("오류"),
                  content: Text("아이디를 확인해주세요."),
                ),
              );
              return;
            }

            try {
              await ApiService().postUsers(
                username: _idController.text,
                password: _passwordController.text,
                name: _nameController.text,
                email: _emailController.text,
                address: _addressController.text,
              );
            } catch (e) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("오류"),
                  content: Text(e.toString()),
                ),
              );
              return;
            }
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          },
          child: const Text('회원가입'),
        ),
      ),
    );
  }
}
