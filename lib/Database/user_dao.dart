import 'package:floor/floor.dart';
import 'user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @insert
  Future<void> insertUser(User user);
}
