import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/app/app_bloc.dart';
import '../../constants/constant.dart';
import '../../core/storage/local_preference.dart';
import '../../theme/colors.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: Home());

  static Route route() {
    return MaterialPageRoute(builder: (_) => const Home());
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

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
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(margin: const EdgeInsets.only(top: 30),),
            const Text(
              Strings.welcomeBoss,
              style: TextStyle(
                  fontSize: 30
              ),
            ),
            Text(
              user.email ?? "",
              style: const TextStyle(
                  fontSize: 20
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    Strings.useBiometricsQ
                ),
                SizedBox(
                  child:  Padding(
                      padding: const EdgeInsets.all(13),
                      child: Switch(
                        value: LocalPreference.getCanUseBiometrics() ?? false,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            LocalPreference.setCanUseBiometrics(value);
                          });
                        },
                        activeTrackColor: AppColors.mainColor,
                        activeColor: AppColors.mainColor,
                      ),
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  context.read<AppBloc>().add(
                      AppLogoutRequested()
                  );
                },
                child: const Text(
                  Strings.logout,
                  style: TextStyle(
                      fontSize: 20
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
