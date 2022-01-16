import 'package:flutter/material.dart';
import 'package:instagram/instagram/view/home/messages_screen/messages_screen.dart';
import 'package:instagram/instagram/view/home/post_feed_screen/post_feed_screen.dart';
import 'package:instagram/instagram/view/home/utils/home_app_bar.dart';
import 'package:instagram/instagram/view/home/utils/home_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: const [
         Scaffold(
          body: SafeArea(child: PostFeedScreen()),
          appBar: HomeAppBar(),
          bottomNavigationBar: HomeBottomNavBar(),
        ),
        MessagesScreen()
      ],
    );
  }
}
