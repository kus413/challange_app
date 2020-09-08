import 'package:flutter/material.dart';
import 'package:yipl_app/Database/database.dart';
import 'package:yipl_app/Database/user.dart';
import 'package:yipl_app/provider/user_json.dart';
import 'services.dart';

class UserProvider with ChangeNotifier {
  List<Users> _userList;

  Future<List<Users>> getUsers() async {
    List<Users> loadedUsers = await Services.getUsers();
    _userList = loadedUsers;
    addUsersToDB();
    notifyListeners();
    return loadedUsers;
  }

  //add users to database user
  Future<void> addUsersToDB() async {
    final database = await $FloorAppDatabase.databaseBuilder('User').build();
    final userDao = database.userDao;

    final user = User(_userList[0].id, _userList[0].name, _userList[0].username,
        _userList[0].email, _userList[0].phone, _userList[0].website);
    final address=Address(_userList[0].address.street,_userList[0].);
    await userDao.insertUser(user);
    print(await userDao.findAllUsers());
  }

  //return specific user
  Users findById(int id) {
    return _userList.firstWhere((users) {
      return users.id == id;
    });
  }
}
