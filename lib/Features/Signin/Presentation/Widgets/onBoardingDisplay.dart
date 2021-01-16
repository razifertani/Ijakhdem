import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class OnBoardingDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: AppColors.primaryColor,
        pages: [
          SkOnboardingModel(
            title: 'Hire freelancers for your job online',
            description:
                'Grow your buisness with the top freelancing application',
            titleColor: Colors.black,
            descripColor: Color(0xFF929794),
            imagePath: 'Assets/Images/1.jpg',
          ),
          SkOnboardingModel(
            title: 'Get it done with a freelancer',
            description: 'Browse the jobs and pick the one you master',
            titleColor: Colors.black,
            descripColor: Color(0xFF929794),
            imagePath: 'Assets/Images/2.jpg',
          ),
          SkOnboardingModel(
            title: 'Don\'t just dream, Do',
            description: 'Freelance services. On demand',
            titleColor: Colors.black,
            descripColor: Color(0xFF929794),
            imagePath: 'Assets/Images/3.jpg',
          ),
        ],
        skipClicked: (value) {
          BlocProvider.of<LoginBloc>(context).dispatch(GoToSigninEvent());
        },
        getStartedClicked: (value) {
          BlocProvider.of<LoginBloc>(context).dispatch(GoToSigninEvent());
        },
      ),
    );
  }
}
