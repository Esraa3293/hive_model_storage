import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_storage/features/home/cubit/home_cubit.dart';
import 'package:student_storage/features/home/cubit/home_states.dart';
import 'package:student_storage/features/home/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController =
      TextEditingController(); //private علشان بستخدمه في الـ textfield ده بس
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  late UserModel userModel = UserModel(
    name: _nameController.text,
    age: int.tryParse(_ageController.text) ?? 0,
    address: _addressController.text,
  );

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  label: Text("Age"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  label: Text("Address"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().addUser(userModel);
                      _nameController.clear();
                      _ageController.clear();
                      _addressController.clear();
                    },
                    child: Text('add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().getUser();
                      _nameController.clear();
                      _ageController.clear();
                      _addressController.clear();
                    },
                    child: Text('get'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().deleteUser();
                      _nameController.clear();
                      _ageController.clear();
                      _addressController.clear();
                    },
                    child: Text('delete'),
                  ),
                ],
              ),
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  if (state is HomeDataLoadedState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(state.userModel.name),
                        Text(state.userModel.age.toString()),
                        Text(state.userModel.address),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
