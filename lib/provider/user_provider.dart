import 'package:flutter/material.dart';
import 'package:yipl_app/provider/user_json.dart';
import 'services.dart';

class UserProvider with ChangeNotifier {
  List<Users> _userList;

  Future<List<Users>> getUsers() async {
    List<Users> loadedUsers = await Services.getUsers();
    _userList = loadedUsers;
    notifyListeners();
    return loadedUsers;
  }

  //return specific user
  Users findById(int id) {
    return _userList.firstWhere((users) {
      return users.id == id;
    });
  }
}
