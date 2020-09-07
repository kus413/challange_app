import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yipl_app/provider/user_provider.dart';
import 'package:yipl_app/widgets/single_user_list_view.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false).getUsers(),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Scaffold(
                  body: Center(
                    child: Container(
                      color: Colors.black,
                      child: FlareActor(
                        "assets/loading-circle-bo.flr",
                        shouldClip: false,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        animation: "Untitled",
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(title: Text("Users")),
                  body: Container(
                    color: Colors.black26,
                    height: MediaQuery.of(context).size.height * 1,
                    child: snapshot.hasError
                        ? Center(
                            child: Text("Sorry user data is not available"))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (ctx, index) => SingleUSerListView(
                              id: snapshot.data[index].id,
                              name: snapshot.data[index].name,
                              phone: snapshot.data[index].phone,
                            ),
                          ),
                  ));
        });
  }
}
