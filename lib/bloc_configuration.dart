import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/instagram/instagram.dart';
import 'package:instagram/instagram/modal/service/auth/auth_service.dart';
import 'package:instagram/instagram/view_modal/login/cubit/login_cubit.dart';
import 'package:logger/logger.dart';

class BlocConfiguration extends StatelessWidget {
  const BlocConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _firebaseAuth = FirebaseAuth.instance;
    var _logger = Logger();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthService(_firebaseAuth, _logger)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
        ],
        child: const InstagramRoot(),
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  final Logger logger;
  MyBlocObserver(this.logger);

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('Created ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i('OnEvent ${bloc.runtimeType} \n $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('OnChange ${bloc.runtimeType} \n $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('OnError ${bloc.runtimeType} \n $error \n $stackTrace');
  }
}
