import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:instagram/bloc_configuration.dart';
import 'package:instagram/firebase_options.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Beamer.setPathUrlStrategy();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final hydratedStorage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  final logger = Logger();

  HydratedBlocOverrides.runZoned(
    () => runApp(const BlocConfiguration()),
    storage: hydratedStorage,
    blocObserver: MyBlocObserver(logger),
  );
}
