import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/blocs/app/app_bloc.dart';

import '../../constants/constant.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: Home());

  @override
  Widget build(BuildContext context) {

    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
               margin: const EdgeInsets.only(top: 30),
               child: Image.asset(
                 Images.appLogo,
               ),
             ),
            const SizedBox(height: 50),
            const Text(Strings.welcomeBoss),
            const SizedBox(height: 40),
            Text(user.email ?? ""),
            TextButton(
                onPressed: () {
                  context.read<AppBloc>().add(
                    AppLogoutRequested()
                  );
                },
                child: const Text(Strings.logout))
          ],
        ),
      ),
    );
  }
}

