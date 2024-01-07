import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterstackapp/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();

  factory HomeBloc() {
    return _homeBlocSingleton;
  }

  final HomeProvider homeProvider = HomeProvider();

  HomeBloc._internal() : super(UnHomeState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      if (event is LoadHomeEvent) {
        // Handle the LoadHomeEvent here
        QuestionData res = await homeProvider.getData();
        yield InHomeState(res);
      }
    } catch (error) {
      print('HomeBloc Error: $error');
      yield state;
    }
  }
}
