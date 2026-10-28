import 'package:hive/hive.dart';
import 'package:student_storage/features/home/models/user_model.dart';

class HiveDataSource {
  final Box _box = Hive.box('user');

  Future<void> addUser(UserModel userData) async {
    await _box.put('user', userData);
  }

  UserModel getUser() {
    return _box.get('user');
  }

  Future<void> deleteUser() async {
    await _box.delete('user');
  }
}
