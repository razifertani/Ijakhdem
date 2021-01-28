import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_chat_bubble/bubble_type.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';
// import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
// import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';

class ProfileWidget extends StatefulWidget {
  final Profile profile;

  const ProfileWidget({Key key, @required this.profile}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  int _select = 0;
  static const double pi = 3.1415926535897932;

  List<String> _skills = ['Android', 'Flutter', 'React-Js'];

  bool show_all_state = false;

  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.3,
          color: AppColors.primaryColor,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              Container(
                color: Colors.white70,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: Image.network(
                          profile.generalInfo.profilePicUrl,
                          width: 200,
                          height: 200,
                        ).image,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("change image");
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      profile.generalInfo.firstName +
                          ' ' +
                          profile.generalInfo.lastName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.pin_drop_outlined,
                            size: 15,
                          ),
                        ),
                        Text(
                          "Tunis, Tunisia.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            // width: double.infinity,
                            // color: Colors.green,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                color: _select == 0 ? Colors.white : null,
                                onPressed: () {
                                  _select = 0;
                                  setState(() {});
                                },
                                child: Text(
                                  "About",
                                  style: TextStyle(
                                    color: _select == 0
                                        ? AppColors.blueColor
                                        : AppColors.greyChar,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            // width: double.infinity,
                            // color: Colors.yellow,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                color: _select == 1 ? Colors.white : null,
                                onPressed: () {
                                  setState(() {
                                    _select = 1;
                                  });
                                },
                                child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                    color: _select == 1
                                        ? AppColors.blueColor
                                        : AppColors.greyChar,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              _select == 0
                  ? Column(
                      children: [
                        Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Summary".toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.rate_review,
                                      color: AppColors.primaryColor,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    profile.generalInfo.about,
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "portfolio".toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    // Icon(Icons.rate_review,color: Colors.blueGrey[400],)
                                  ],
                                ),
                                Column(
                                  children: [
                                    ///in case portfolio is inexistant
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0),
                                    //   child: Image.asset(
                                    //     "Assets/Images/notes.png",
                                    //     width: 100,
                                    //     height: 100,
                                    //   ),
                                    // ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: 120,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 2,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 50,
                                              child: Card(
                                                elevation: 5,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 50,
                                                        backgroundImage:
                                                            Image.asset(
                                                                    'Assets/Images/js.png')
                                                                .image,
                                                      ),
                                                    ),
                                                    Text("Javascript Project"),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Add your portoflio item on IjaEkhdem.tn "
                                        "Show the world , what are you capable of .",
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "skills".toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                      disabledColor: Colors.red,
                                      splashRadius: 20,
                                      highlightColor: Colors.red,
                                      icon: Icon(
                                        Icons.add_box,
                                        color: AppColors.primaryColor,
                                      ),
                                      onPressed: () {},
                                      color: Colors.blueGrey,
                                    )
                                    // Icon(Icons.rate_review,color: Colors.blueGrey[400],)
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ListView(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              children: List.generate(
                                                _skills.length,
                                                (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    padding: EdgeInsets.zero,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .blueGrey[100]),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10))),
                                                            height: 40,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 9,
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Text(
                                                                "${_skills[index]}"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ).toList().cast<Widget>(),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        ExpansionTile(
                          trailing: Transform.rotate(
                              angle: show_all_state
                                  ? 180 * pi / 180
                                  : 180 * pi / 90,
                              child: Icon(
                                Icons.arrow_drop_down_circle,
                              )),
                          initiallyExpanded: false,
                          onExpansionChanged: (val) {
                            setState(() {
                              show_all_state = val;
                              if (val == true) {
                                _skills.add("Vanilla javascript");
                                _skills.add("Node-js");
                                return;
                              }
                              print("remove here");
                              _skills.removeLast();
                              _skills.removeLast();
                            });
                          },
                          title: show_all_state
                              ? Text("Show Less")
                              : Text("Show All"),
                        )
                      ],
                    )
                  : ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, i) {
                        return Divider();
                      },
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, i) {
                        return ListTile(
                          dense: true,
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                Image.asset('Assets/Images/1.jpg').image,
                          ),
                          // title: Text("10/10"),
                          // subtitle: ChatBubble(
                          //   clipper: ChatBubbleClipper5(
                          //       type: BubbleType.receiverBubble),
                          //   alignment: Alignment.topRight,
                          //   margin: EdgeInsets.only(top: 20),
                          //   backGroundColor: Colors.blue,
                          //   child: Container(
                          //     constraints: BoxConstraints(
                          //       maxWidth:
                          //           MediaQuery.of(context).size.width * 0.7,
                          //     ),
                          //     child: Text(
                          //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor .",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        );
                      },
                    )
            ],
          ),
        ),
      ],
    ));
  }
}
