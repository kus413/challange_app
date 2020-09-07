import 'package:flutter/material.dart';
import 'package:yipl_app/screen/user_detail_screen.dart';

// ignore: must_be_immutable
class SingleUSerListView extends StatelessWidget {
  int id;
  String name, phone;
  SingleUSerListView({this.id, this.name, this.phone});

  showDialogFuc(id, context) {
    return showDialog(
        context: context,
        builder: (context) {
          return UserDetailScreen(id);
        });
  }

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
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                    SizedBox(width: 5.0),
                    FittedBox(
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            phone,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40.0,
                width: 70.0,
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: FlatButton(
                  onPressed: () {
                    showDialogFuc(id, context);
                  },
                  child: Text(
                    "View",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                  color: Colors.red[200],
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
