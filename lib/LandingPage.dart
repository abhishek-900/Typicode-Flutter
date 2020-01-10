import 'package:flutter/material.dart';

import 'package:rodo_assignment/appdrawer.dart';
import 'package:rodo_assignment/card_design.dart';
import 'package:rodo_assignment/detail_screen.dart';
import 'package:rodo_assignment/model/http_file.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var landingData = LandingData();
  var _isLoading=false;

  @override
  void initState() {
    setState(() {
      _isLoading=true;
    });
    landingData.fetchPost().then((_){
      setState(() {
        _isLoading=false;
      });
    });
    landingData.fetchUser();
    print("landing page here ");
    print(landingData.item.length);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3C4154),
      drawer: AppDrawer(landingData.user),
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            elevation: 1.2,
            onSelected: (value) {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            tooltip: "Albums here !",
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 0,
                child: Text("Album"),
              ),
            ],
          ),
        ],
        backgroundColor: Color(0xff3C4154),
        title: Text("Post"),
      ),
      body:_isLoading==true?Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),): ListView.builder(
          itemCount: landingData.item.length,
          itemBuilder: (context, index) {
            return CardDesign(landingData.item[index]);
          }),
    );
  }
}
