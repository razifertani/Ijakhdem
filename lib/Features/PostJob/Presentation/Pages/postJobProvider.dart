import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Features/PostJob/Presentation/Pages/postJobPage.dart';
import 'package:Ijakhdem/Features/PostJob/Presentation/bloc/postJob_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/injection_container.dart';

class PostJobProvider extends StatelessWidget {
  final Profile profile;
  const PostJobProvider({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        body: BlocProvider(
          builder: (_) => sl<PostJobBloc>(),
          child: PostJobPage(
            profile: profile,
          ),
        ),
      ),
    );
  }
}
