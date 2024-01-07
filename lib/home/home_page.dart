import 'package:flutter/material.dart';
import 'package:flutterstackapp/home/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomeScreen(
        homeBloc: BlocProvider.of<HomeBloc>(context),
      ),
    );
  }
}
