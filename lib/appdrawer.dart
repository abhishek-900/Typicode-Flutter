import 'package:flutter/material.dart';
import 'package:rodo_assignment/detail_screen.dart';
import 'package:rodo_assignment/model/user_info.dart';

class AppDrawer extends StatelessWidget {
  List<User> userData = [];

  AppDrawer(this.userData);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Color(0xff3C4154),
              Color(0xff424A5D),
            ])),
            child: Text(
              "Hello Users !",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
        Expanded(
          child: ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailScreen.routeName,
                        arguments: {
                          "userId": userData[index].id,
                          "userData": userData[index]
                        });
                  },
                  child: ListTile(
                    trailing: Icon(Icons.chevron_right),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xff3C4154),
                      child: Image.network(
                          "https://previews.123rf.com/images/farhad73/farhad731807/farhad73180700006/104271850-man-cartoon-face-with-glasses-vector-illustration-.jpg"),
                    ),
                    title: Text(
                      userData[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      userData[index].email,
                      softWrap: true,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                );
              }),
        ),
      ],
    ));
  }
}
