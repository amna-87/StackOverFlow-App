import 'package:equatable/equatable.dart';
import 'package:flutterstackapp/home/index.dart';

abstract class HomeState extends Equatable {
  HomeState();

  HomeState getStateCopy();

  @override
  List<Object> get props => [];
}

class UnHomeState extends HomeState {
  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }
}

class InHomeState extends HomeState {
  final QuestionData questionData;

  InHomeState(this.questionData);

  @override
  List<Object> get props => [questionData];

  @override
  HomeState getStateCopy() {
    return InHomeState(questionData);
  }
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }
}
