import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:instagram/instagram/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Widget initPage(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoginScreen(),
      ),
    );
  }

  final _loginProvider = const [
    GoogleProviderConfiguration(clientId: '1'),
    FacebookProviderConfiguration(clientId: '1'),
  ];

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providerConfigs: _loginProvider,
      showAuthActionSwitch: false,
      headerBuilder: (context, constraints, shrinkOffset) {
        return Stack(
          children: [
            ConstrainedBox(
              constraints: constraints,
              child: Image.asset(
                ImageAssets.logoTitle,
              ),
            ),
            const Align(alignment: Alignment(0.45, 0.25), child: Text("Clone")),
          ],
        );
      },
      actions: [
        AuthStateChangeAction((authCtx, authState) {
          if (authState is SignedIn) {
            Beamer.of(authCtx).beamToReplacementNamed('/home');
          }
        }),
      ],
    );
  }
}
