import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_pass_auth/core/app.dart';
import 'package:our_pass_auth/core/storage/local_preference.dart';
import 'package:our_pass_auth/firebase_options.dart';
import 'package:our_pass_auth/repository/auth_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalPreference.init();
  final authRepository = AuthRepository();
  runApp(OurPassAuthApp(authRepository: authRepository));
}

