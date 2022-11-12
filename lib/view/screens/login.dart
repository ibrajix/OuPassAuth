import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/core/storage/storage_service.dart';
import 'package:our_pass_auth/cubits/login/login_cubit.dart';
import 'package:our_pass_auth/repository/AuthRepository.dart';
import 'package:our_pass_auth/view/widgets/show_biometrics.dart';

import '../../constants/constant.dart';

class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: Login());
  static Route route() {
    return MaterialPageRoute(builder: (_) => const Login());
  }

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final StorageService storageService = StorageService();
  String? _savedSecureEmail = "";
  String? _savedSecurePassword = "";
  String? _checkFirstTimeLogin = Strings.isFirstTimeFalse;

  @override
  void initState() {
    super.initState();
    fetchSecuredStorageData();
  }

  Future<void> fetchSecuredStorageData() async {
    _savedSecureEmail = await storageService.getEmail();
    _savedSecurePassword = await storageService.getPassword();
    _checkFirstTimeLogin = await storageService.getIsFirstTimeLogin();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthRepository>()),
          child: Column(
            children: [
              const SizedBox(height: 50),
              if(_checkFirstTimeLogin == Strings.isFirstTimeFalse)
                  const ShowBioMetrics()
            ],
          ),
        ),
      ),
    );
  }

}
