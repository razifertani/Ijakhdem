import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Core/Utils/appBottomNavigationBar.dart';
import 'package:Ijakhdem/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDisplay extends StatefulWidget {
  final Profile profile;

  const HomeDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _HomeDisplayState createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> names = [
    'Websites, IT & Software',
    'Writing & content',
    'Sales & marketing',
    'Data entry & admin',
    'Design, media & architecture',
    'Engineering & science',
  ];
  List<String> imgs = [
    'Assets/Images/pc.png',
    'Assets/Images/notes.png',
    'Assets/Images/bar-chart.png',
    'Assets/Images/code.png',
    'Assets/Images/sketch.png',
    'Assets/Images/startup.png',
  ];

  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // onPressed: () => Scaffold.of(context).openDrawer(),
      appBar: AppBar(
        title: Text('Browse'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.02,
          screenHeight * 0,
          screenWidth * 0.02,
          screenHeight * 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                'Browse',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Container(
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    // controller: searchController,
                    // focusNode: _searchFocus,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                      ),
                      hintText: 'Search for freelancers or jobs',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Text(
                'Recommended jobs',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Container(
                  width: screenWidth * 0.9,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: screenHeight * 0.04,
                        thickness: 1.5,
                        color: Colors.grey[200],
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          dispatchGoToSpecificJob(profile);
                        },
                        child: Column(
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
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ListTile(
                title: Text(
                  'Show all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  dispatchGoToRecommendedJobs(profile);
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                'Browse by categorie',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.01,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.5,
                    crossAxisSpacing: 12.5,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        dispatchGoToListCategories(profile);
                      },
                      child: Container(
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              child: Image.asset(
                                imgs[index],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Text(
                              names[index],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        profile: profile,
      ),
    );
  }

  dispatchGoToRecommendedJobs(Profile profile) {
    BlocProvider.of<HomeBloc>(context).dispatch(
      GoToRecommendedJobsEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToListCategories(Profile profile) {
    BlocProvider.of<HomeBloc>(context).dispatch(
      GoToListCategoriesEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToSpecificJob(Profile profile) {
    BlocProvider.of<HomeBloc>(context).dispatch(
      GoToSpecificJobEvent(
        profile: profile,
      ),
    );
  }
}
