import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hashpass/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/data/data.dart';
import 'src/domain/cubit/app_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  final SharedPreferences sp = await SharedPreferences.getInstance();

  final UserRepositoryImpl userRepository = UserRepositoryImpl();

  final appCubit = AppCubit(
    userRepository: userRepository,
  );

  await appCubit.init();

  FlutterNativeSplash.remove();

  await Firebase.initializeApp();

  runApp(
    App(
      appCubit: appCubit,
    ),
  );
}
