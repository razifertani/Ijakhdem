import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatefulWidget {
  final Profile profile;

  const NotificationsWidget({Key key, @required this.profile})
      : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SafeArea(
          child: ListTile(
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Text("Here is what's going on today"),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return ListTile(
              leading: ClipOval(
                child: Image.asset('Assets/Images/1.jpg'),
              ),
              title: Text(
                  "Jack Sparrow and 12 others bid an average \$80.0 on i need website"),
              subtitle:
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 10,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text("8d 5h 32m ago"),
                )
              ]),
            );
          }),
    );
  }
}
