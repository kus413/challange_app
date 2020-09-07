import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yipl_app/provider/user_provider.dart';

// ignore: must_be_immutable
class UserDetailScreen extends StatelessWidget {
  int id;
  UserDetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final userDetail = Provider.of<UserProvider>(context).findById(id);
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: EdgeInsets.all(15.0),
          width: mediaQuery.width * 0.8,
          height: mediaQuery.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userDetail.name,
                style: TextStyle(fontSize: 24.0),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"))
            ],
          ),
        ),
      ),
    );
  }
}
