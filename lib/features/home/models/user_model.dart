import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final String address;

  UserModel({required this.name, required this.age, required this.address});
}
