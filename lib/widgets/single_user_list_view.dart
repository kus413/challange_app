import 'package:flutter/material.dart';
import 'package:yipl_app/screen/user_detail_screen.dart';
import 'package:yipl_app/widgets/user_detail_view.dart';

// ignore: must_be_immutable
class SingleUSerListView extends StatelessWidget {
  int id;
  String name, phone;
  SingleUSerListView({this.id, this.name, this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 100.0,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(90, 54, 115, 1),
                        radius: 10.0,
                        child: Text(
                          name.substring(0, 1),
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        ),
                      ),
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            phone,
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40.0,
                width: 70.0,
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, UserDetailScreen.routeId,
                        arguments: id);
                  },
                  child: Text(
                    "View",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  color: Color.fromRGBO(225, 48, 108, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
