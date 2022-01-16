import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          label: 'lable-1',
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: 'lable-2',
          icon: Icon(Icons.search_outlined),
        ),
        BottomNavigationBarItem(
          label: 'lable-3',
          icon: Icon(Icons.add_outlined),
        ),
        BottomNavigationBarItem(
          label: 'lable-4',
          icon: Icon(Icons.thumb_up_outlined),
        ),
        BottomNavigationBarItem(
          label: 'lable-5',
          icon: Icon(Icons.person_outline),
        ),
      ],
    );
  }
}
