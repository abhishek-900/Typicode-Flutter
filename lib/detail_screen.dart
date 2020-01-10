import 'package:flutter/material.dart';
import 'package:rodo_assignment/card_design.dart';
import 'package:rodo_assignment/model/http_file.dart';
import 'package:rodo_assignment/model/post.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail-screen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var landingData = LandingData();
  var _isLoading = false;

  String imageurl =
      "https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80";
  var userData;

  @override
  void didChangeDependencies() {
    userData = ModalRoute.of(context).settings.arguments as Map<String,dynamic>;
    //print(userData['userid']);


    setState(() {
      _isLoading = true;
    });
    landingData.postFindById(userData['userId']).then((_) {
      setState(() {
        _isLoading = false;
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            : CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 300,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        title: Text(userData['userData'].username),
                        background: Image.network(
                          imageurl,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 10,
                    ),
                    //Chip(label: Text("ABOUT ME ",textScaleFactor: 1.25,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

                   Container(
                     child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text("Original Name: "+userData['userData'].name,style: TextStyle(fontSize: 20),),
                          Text("Street: "+userData['userData'].address.street,style: TextStyle(fontSize: 20),),
                          Text("Website: "+userData['userData'].website,style: TextStyle(fontSize: 20,),),

                        ],
                      ),
                      height: 100,
                    ), SizedBox(height: 20,),
                    Container(
                      //color: Colors.yellow,
                      height: 150,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: landingData.postById.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTapDown: (value){
                                print(value);
                              },


                              child: Card(

                                elevation: 4,
                                color:  Color(0xff3C4154),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(5),
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    color: Color(0xff424A5D),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 5,),
                                        Text("Title:-",style: TextStyle(color: Colors.white),),
                                        Text(
                                          landingData.postById[index].title,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 1,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 30,),
                                        Text(
                                          landingData.postById[index].body,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ),
                            );
                          }),
                    ),
                        SizedBox(height: 70,)
                  ])),
                ],
              ));
  }
}

/*_isLoading==true?Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),): ListView.builder(
            itemCount: landingData.postById.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(landingData.postById
              [index].title),);
            })*/
