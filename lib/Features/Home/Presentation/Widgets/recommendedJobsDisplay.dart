import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedJobsDisplay extends StatefulWidget {
  final Profile profile;

  RecommendedJobsDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _RecommendedJobsDisplayState createState() => _RecommendedJobsDisplayState();
}

class _RecommendedJobsDisplayState extends State<RecommendedJobsDisplay> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recommended Jobs',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () => dispatchGoToHome(profile),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.03,
          ),
          alignment: Alignment.topCenter,
          child: ListView.separated(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: screenHeight * 0.04,
                thickness: 1.5,
                color: Colors.grey[200],
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This is the job title',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ),
                              Text('6 days left'),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.005,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.euro,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ),
                              Text('30\$ - 250\$ EUR'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.25,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Text('2 bids'),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  dispatchGoToHome(Profile profile) {
    BlocProvider.of<HomeBloc>(context).dispatch(
      GoToHomeEvent(
        profile: profile,
      ),
    );
  }
}
