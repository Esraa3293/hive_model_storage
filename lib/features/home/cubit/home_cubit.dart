import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_storage/core/data_source/hive_data_source.dart';
import 'package:student_storage/features/home/cubit/home_states.dart';
import 'package:student_storage/features/home/models/user_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  HiveDataSource dataSource = HiveDataSource();

  Future<void> addUser(UserModel userData) async {
    emit(HomeLoadingState());
    try {
      await dataSource.addUser(userData);
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  void getUser() {
    HomeLoadingState();
    try {
      UserModel userData = dataSource.getUser();
      emit(HomeDataLoadedState(userModel: userData));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> deleteUser() async {
    emit(HomeLoadingState());
    try {
      await dataSource.deleteUser();
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
