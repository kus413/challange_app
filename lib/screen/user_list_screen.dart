import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yipl_app/provider/services.dart';
import 'package:yipl_app/provider/user_json.dart';
import 'package:yipl_app/provider/user_provider.dart';
import 'package:yipl_app/widgets/single_user_list_view.dart';
import 'package:flutter/services.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<Users> _userFromJson;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getUsers().then((users) {
      setState(() {
        _userFromJson = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserProvider>(context);
    users.setUsers(_userFromJson);
    final loadedUsers = users.users;
    return _userFromJson.isEmpty
        ? Scaffold(
            body: Center(
              child: Container(
                color: Colors.black12,
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: loadedUsers.length,
                itemBuilder: (ctx, index) => SingleUSerListView(
                  id: loadedUsers[index].id,
                  name: loadedUsers[index].name,
                  phone: loadedUsers[index].phone,
                ),
              ),
            ),
          );
  }
}
