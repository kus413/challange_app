import 'dart:io';

import 'package:http/http.dart' as http;
import 'user_json.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users/';
  static Future<List<Users>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Users> users = usersFromJson(response.body);
        return users;
      } else {
        throw HttpException("Could not load data");
      }
    } catch (e) {
      throw e;
    }
  }
}
