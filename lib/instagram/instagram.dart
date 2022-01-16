import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:instagram/instagram/modal/service/auth/auth_service.dart';
import 'package:instagram/instagram/router/location_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstagramRoot extends StatefulWidget {
  const InstagramRoot({Key? key}) : super(key: key);

  @override
  State<InstagramRoot> createState() => _InstagramRootState();
}

class _InstagramRootState extends State<InstagramRoot> {
  final routerDelegate = BeamerDelegate(
    initialPath: '/home',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        LoginLocation(),
        HomeLocation(),
      ],
    ),
    guards: [
      BeamGuard(
        pathPatterns: ['/home'],
        check: (ctx, location) => ctx.read<AuthService>().isAuthenticated,
        beamToNamed: (_, __) => '/login',
      ),
    ],
    notFoundRedirectNamed: '/login',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Configuration - Theme
      title: 'Instagram Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // Navigator
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),

      // Localization
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterFireUILocalizations.delegate,
      ],
    );
  }
}
