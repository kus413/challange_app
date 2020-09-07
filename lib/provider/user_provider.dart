import 'package:flutter/material.dart';
import 'package:yipl_app/provider/user_json.dart';
import 'services.dart';

class UserProvider with ChangeNotifier {
  List<Users> _userList;

  //set users from json
  void setUsers(List<Users> usersList) {
    _userList = usersList;
  }

  //return complete users
  List<Users> get users {
    return [..._userList];
  }

  //return specific user
  Users findById(int id) {
    return _userList.firstWhere((users) {
      return users.id == id;
    });
  }
}
