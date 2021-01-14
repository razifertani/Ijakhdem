import 'package:Ijakhdem/Features/Signin/Presentation/Pages/signinPage.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:Ijakhdem/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninProvider extends StatelessWidget {
  final bool fromLogout;
  const SigninProvider({Key key, this.fromLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        body: BlocProvider(
          builder: (_) => sl<LoginBloc>(),
          child: SignInPage(
            fromLogout: fromLogout,
          ),
        ),
      ),
    );
  }
}
