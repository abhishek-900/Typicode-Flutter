import 'package:flutter/material.dart';
import 'package:rodo_assignment/detail_screen.dart';
import 'package:rodo_assignment/model/post.dart';

class CardDesign extends StatelessWidget {
  Post postdata;

  CardDesign(this.postdata);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.white,
        child: Icon(
          Icons.delete,
          color: Colors.black,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      key: ValueKey(postdata.id),
      child: Card(
          margin: EdgeInsets.all(15),
          elevation: 5,
          color: Color(0xff424A5D),
          child: ListTile(
            onTap: () {
              //logic here
              Navigator.pushNamed(context, DetailScreen.routeName);
              },
            leading: Icon(
              Icons.book,
              color: Colors.white,
              size: 32,
            ),
            title: Text(
              postdata.title,
              softWrap: true,
              maxLines: 2,
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
            subtitle: Text(
              postdata.body,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.clip,
              style: TextStyle(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.all(10),
          )),
    );
  }
}
