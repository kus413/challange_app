import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yipl_app/provider/user_provider.dart';

// ignore: must_be_immutable
class UserDetailView extends StatelessWidget {
  int id;
  UserDetailView(this.id);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final userDetail = Provider.of<UserProvider>(context).findById(id);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "OK",
            style:
                TextStyle(color: Color.fromRGBO(90, 54, 115, 1), fontSize: 20),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(90, 54, 115, 1),
                      radius: 10.0,
                      child: Text(
                        userDetail.name.substring(0, 1),
                        style: TextStyle(fontSize: 50.0, color: Colors.white),
                      ),
                    ),
                    height: 120,
                    width: 120,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    userDetail.name,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
              height: mediaQuery.height * .25,
              width: mediaQuery.width * 1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
                color: Color.fromRGBO(225, 48, 108, 1),
              ),
              padding: EdgeInsets.only(left: 60, top: 30),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          userDetail.email,
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(
                          Icons.my_location,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Street:  ' + userDetail.address.street,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'City:  ' + userDetail.address.city,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Suite:  ' + userDetail.address.suite,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Zipcode:  ' + userDetail.address.zipcode,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Geo:  ' +
                                  userDetail.address.geo.lat +
                                  ", " +
                                  userDetail.address.geo.lng,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          userDetail.phone,
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(
                          Icons.web,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          userDetail.website,
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Container(
                          width: mediaQuery.width * .61,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: " + userDetail.company.name,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Catch Phrase: " +
                                    userDetail.company.catchPhrase,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "BS: " + userDetail.company.bs,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              height: mediaQuery.height * .70,
              width: mediaQuery.width * 1,
            ),
          ],
        ),
      ),
    );
  }
}
