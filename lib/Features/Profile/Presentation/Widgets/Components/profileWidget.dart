import 'dart:io';

import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  int _select = 0;
  static const double pi = 3.1415926535897932;

  List<String> _skills = ['Android', 'Flutter', 'React-Js'];

  bool show_all_state = false;

  GlobalKey scaffold_key = new GlobalKey();

  TextEditingController summaryController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffold_key,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            dispatchGoToProfileDisplay(profile);
          },
        ),
        backgroundColor: Colors.blueAccent[100],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.35,
            color: Colors.blueAccent[100],
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: Image.network(
            //       profile.generalInfo.coverPicUrl ??
            //           'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
            //       fit: BoxFit.fitHeight,
            //     ).image,
            //   ),
            // ),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _image ??
                              Image.network(
                                profile.generalInfo.profilePicUrl ??
                                    'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
                              ).image,
                        ),
                        GestureDetector(
                          onTap: getImage,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Summary".toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.rate_review),
                                        onPressed: () {
                                          setState(() {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: MediaQuery.of(
                                                                context)
                                                            .padding
                                                            .top),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height:
                                                          screenHeight * 0.8,
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          AppBar(
                                                            title: Text(
                                                              "Edit profile",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            backgroundColor:
                                                                Colors.white,
                                                            automaticallyImplyLeading:
                                                                false,
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Summary",
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  decoration: TextDecoration.none,
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.normal,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 8.0),
                                                                            child:
                                                                                TextField(
                                                                              decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade500))),
                                                                              maxLength: 4000,
                                                                              controller: summaryController,
                                                                              textInputAction: TextInputAction.done,
                                                                              minLines: 5,
                                                                              maxLines: null,
                                                                            ),
                                                                          ),
                                                                        ]),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomCenter,
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            double.infinity /
                                                                                2,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(16.0),
                                                                          child:
                                                                              FlatButton(
                                                                            color:
                                                                                Colors.blueAccent,
                                                                            highlightColor:
                                                                                Colors.white,
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                profile.generalInfo.about = summaryController.text.trim();
                                                                              });
                                                                              dispatchEditProfile(profile);
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                                                                              child: Text(
                                                                                "Save ",
                                                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          });
                                        },
                                        color: AppColors.primaryColor,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Center(
                                      child: Text(
                                        profile.generalInfo.about ??
                                            'Write a description here !',
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.justify,
                                      ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          height: 150,
                                          child: ListView.builder(
                                            itemCount: 5,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemBuilder: (context, i) {
                                              return Container(
                                                height: 80,
                                                child: Card(
                                                  elevation: 5,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0),
                                                          child: Text(
                                                              "Javascript Project"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Image.asset(
                                          "Assets/Images/notes.png",
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                      /*
                                                                                                                        Padding(
                                                                                                                          padding:
                                                                                                                              const EdgeInsets.only(top: 8.0),
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
                                                                                                                                        Text(
                                                                                                                                            "Javascript Project"),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        */
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
                                        onPressed: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context:
                                                  scaffold_key.currentContext,
                                              builder: (context) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      top:
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .top),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: Colors.white,
                                                          child: Scaffold(
                                                            body: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                AppBar(
                                                                  title: Text(
                                                                    "Edit skills",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  actions: [
                                                                    OutlineButton(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            "save last state");
                                                                      },
                                                                      child: Text(
                                                                          "Save"),
                                                                      color: Colors
                                                                          .white,
                                                                      borderSide:
                                                                          BorderSide
                                                                              .none,
                                                                    )
                                                                  ],
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  iconTheme:
                                                                      IconThemeData(
                                                                    color: Colors
                                                                        .black, //change your color here
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 15, right: 15),
                                                                              child: TextField(
                                                                                textAlign: TextAlign.left,
                                                                                scrollPadding: EdgeInsets.zero,
                                                                                expands: false,
                                                                                decoration: InputDecoration(isDense: true, contentPadding: EdgeInsets.all(0), border: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.red), borderRadius: BorderRadius.circular(5)), prefixIcon: Icon(Icons.search), hintText: "Search skills"),
                                                                              ),
                                                                            ),
                                                                            RichText(
                                                                              text: TextSpan(
                                                                                text: "4",
                                                                                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                                                                                children: [
                                                                                  TextSpan(text: "/25\nSelected skills", style: TextStyle(color: Colors.grey.shade500, fontSize: 16))
                                                                                ],
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Text(
                                                                                "My-Skills".toUpperCase(),
                                                                                style: TextStyle(color: Colors.grey.shade500),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: ListView.separated(
                                                                                  itemCount: 30,
                                                                                  shrinkWrap: true,
                                                                                  separatorBuilder: (context, i) {
                                                                                    return Divider();
                                                                                  },
                                                                                  itemBuilder: (context, i) {
                                                                                    return ListTile(
                                                                                      trailing: RawMaterialButton(
                                                                                        visualDensity: VisualDensity.compact,
                                                                                        onPressed: () {},
                                                                                        elevation: 2.0,
                                                                                        fillColor: Colors.red,
                                                                                        child: Icon(
                                                                                          Icons.close,
                                                                                        ),
                                                                                        shape: CircleBorder(),
                                                                                      ),
                                                                                      leading: Text(
                                                                                        "${_skills[0]}",
                                                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Text("Skills".toUpperCase(), style: TextStyle(color: Colors.grey.shade500)),
                                                                            ),
                                                                            Expanded(
                                                                              child: ListView.separated(
                                                                                  itemCount: 20,
                                                                                  shrinkWrap: true,
                                                                                  separatorBuilder: (context, i) => Divider(),
                                                                                  itemBuilder: (context, i) {
                                                                                    return ListTile(
                                                                                      dense: true,
                                                                                      trailing: RawMaterialButton(
                                                                                        visualDensity: VisualDensity.compact,
                                                                                        onPressed: () {},
                                                                                        elevation: 2.0,
                                                                                        fillColor: Colors.grey,
                                                                                        child: Icon(
                                                                                          Icons.add,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        shape: CircleBorder(),
                                                                                      ),
                                                                                      leading: Text(
                                                                                        "${_skills[0]}",
                                                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        color: Colors.blueGrey,
                                      )
                                      // Icon(Icons.rate_review,color: Colors.blueGrey[400],)
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
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
                                              child: Column(
                                                children: [
                                                  ListView(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    children: List.generate(
                                                      _skills.length,
                                                      (index) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                          .blueGrey[
                                                                      100]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .green,
                                                                      borderRadius: BorderRadius.only(
                                                                          bottomLeft: Radius.circular(
                                                                              10),
                                                                          topLeft:
                                                                              Radius.circular(10))),
                                                                  height: 40,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 9,
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
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
                                                  Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            dividerColor: Colors
                                                                .transparent),
                                                    child: ExpansionTile(
                                                      trailing:
                                                          Transform.rotate(
                                                              angle:
                                                                  show_all_state
                                                                      ? 180 *
                                                                          pi /
                                                                          180
                                                                      : 180 *
                                                                          pi /
                                                                          90,
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_drop_down_circle,
                                                              )),
                                                      initiallyExpanded: false,
                                                      onExpansionChanged:
                                                          (val) {
                                                        setState(() {
                                                          show_all_state = val;
                                                          if (val == true) {
                                                            _skills.add(
                                                                "Vanilla javascript");
                                                            _skills
                                                                .add("Node-js");
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
                                                    ),
                                                  )
                                                ],
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
                            title: Text("10/10"),
                            subtitle: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor .",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
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
      ),
    );
  }

  dispatchGoToProfileDisplay(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToProfileDisplayEvent(
        profile: profile,
      ),
    );
  }

  dispatchEditProfile(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      EditProfileEvent(
        profile: profile,
      ),
    );
  }
}
