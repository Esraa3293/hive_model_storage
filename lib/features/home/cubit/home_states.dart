import 'package:student_storage/features/home/models/user_model.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeDataLoadedState extends HomeStates {
  final UserModel userModel;

  HomeDataLoadedState({required this.userModel});
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState({required this.message});
}
