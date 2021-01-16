import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Core/Utils/loadingWidget.dart';
import 'package:Ijakhdem/Features/Home/Presentation/Widgets/homeDisplay.dart';
import 'package:Ijakhdem/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class HomePage extends StatelessWidget {
  final Profile profile;

  const HomePage({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is EmptyHomeState) {
          return HomeDisplay(
            profile: profile,
          );
        }

        if (state is GoToHomeState) {
          return HomeDisplay(
            profile: state.profile,
          );
        }

        if (state is LoadingHomeState) {
          return LoadingWidget();
        }

        return LoadingWidget();
      },
    );
  }
}
