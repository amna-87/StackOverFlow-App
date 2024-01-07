import 'package:flutterstackapp/home/index.dart';

abstract class HomeEvent {
  Future<HomeState> applyAsync({
    HomeState? currentState,
    required HomeBloc bloc,
  });
}

class LoadHomeEvent extends HomeEvent {
  @override
  Future<HomeState> applyAsync({
    HomeState? currentState,
    required HomeBloc bloc,
  }) async {
    try {
      QuestionData res = await bloc.homeProvider.getData();
      return InHomeState(res);
    } catch (error) {
      print('LoadHomeEvent Error: $error');
      return ErrorHomeState(error.toString());
    }
  }
}
