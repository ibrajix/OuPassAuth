import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/core/app.dart';
import 'package:our_pass_auth/core/storage/local_preference.dart';
import 'package:our_pass_auth/firebase_options.dart';
import 'package:our_pass_auth/repository/auth_repository.dart';

import 'blocs/app/app_bloc_observer.dart';

Future<void> main() {

  return BlocOverrides.runZoned(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
        await LocalPreference.init();
        final authRepository = AuthRepository();
        runApp(OurPassAuthApp(authRepository: authRepository));
      },
    blocObserver: AppBlocObserver()
  );


}

