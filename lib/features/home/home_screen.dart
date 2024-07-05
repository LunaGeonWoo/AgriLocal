import 'package:agrilocal/features/chat/chatting_list_screen.dart';
import 'package:agrilocal/features/product/product_list_screen.dart';
import 'package:agrilocal/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Menu { productList, chatting, profile }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class ScreenData {
  final Widget title;
  final Widget body;

  ScreenData({
    required this.title,
    required this.body,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  Menu _selectedMenu = Menu.productList;

  final _showingScreen = {
    Menu.productList: ScreenData(
      title: const Text("제품 리스트"),
      body: const ProductListScreen(),
    ),
    Menu.chatting: ScreenData(
      title: const Text("채팅"),
      body: const ChattingListScreen(),
    ),
    Menu.profile: ScreenData(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("프로필"),
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.gear))
        ],
      ),
      body: const ProfileScreen(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showingScreen[_selectedMenu]!.title,
      ),
      body: _showingScreen[_selectedMenu]!.body,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => setState(() {
                _selectedMenu = Menu.productList;
              }),
              icon: const FaIcon(FontAwesomeIcons.house),
            ),
            IconButton(
              onPressed: () => setState(() {
                _selectedMenu = Menu.chatting;
              }),
              icon: const FaIcon(FontAwesomeIcons.solidComment),
            ),
            IconButton(
              onPressed: () => setState(() {
                _selectedMenu = Menu.profile;
              }),
              icon: const FaIcon(FontAwesomeIcons.solidUser),
            ),
          ],
        ),
      ),
    );
  }
}
