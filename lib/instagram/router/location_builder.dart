import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:instagram/instagram/view/home/home_screen.dart';
import 'package:instagram/instagram/view/login/login_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/home'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('home'),
        name: 'home',
        title: 'home',
        child: HomeScreen(),
      ),
    ];
    return pages;
  }
}

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/login'];
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = <BeamPage>[
       BeamPage(
        key: const ValueKey('login'),
        name: 'login',
        title: 'login',
        child: LoginScreen.initPage(context),
      ),
    ];
    return pages;
  }
}
