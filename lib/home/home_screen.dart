import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstackapp/home/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required HomeBloc homeBloc,
  }) : _homeBloc = homeBloc,
       super(key: key);

  final HomeBloc _homeBloc;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget._homeBloc.add(LoadHomeEvent());
  }

  @override
  void dispose() {
    widget._homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget._homeBloc,
      builder: (BuildContext context, HomeState currentState) {
        if (currentState is UnHomeState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (currentState is ErrorHomeState) {
          return Container(
            child: Center(
              child: Text(currentState.errorMessage ?? 'Error'),
            ),
          );
        }
        if (currentState is InHomeState) {
          QuestionData questionData = currentState.questionData;

          return Material(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 96, 157, 194),
                            Color.fromARGB(255, 31, 124, 200),
                            Color.fromARGB(255, 17, 110, 224),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Text("Stack Overflow"),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.10,
                      left: 150,
                      right: MediaQuery.of(context).size.width * 0.1,
                      child: Text(
                        "Weclome from Amna Masroor - 003",
                        style: TextStyle(
                          color: Color.fromARGB(231, 8, 8, 8),
                          fontWeight: FontWeight.bold,
                          fontSize: 20, 
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Questions",
                    style: TextStyle(
                      color: Color.fromARGB(255, 19, 19, 19),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: questionData.questions.length,
                    itemBuilder: (context, i) {
                      Questions questions = questionData.questions[i];
                      String tags = questions.tags;
                      tags = tags.substring(1, tags.length - 1);
                      var tagList = tags.split(",");
                      return ListTile(
                        dense: true,
                        isThreeLine: true,
                        leading: CircleAvatar(
                          radius: 25,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueGrey,
                          child: Text(questions.voteCount.toString()),
                        ),
                        title: Text(questions.question),
                        trailing: Chip(
                          backgroundColor: Colors.blueGrey,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: Text(
                            questions.views,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        subtitle: Wrap(
                          children: tagList
                              .map((t) => Padding(
                                  padding: EdgeInsets.all(9),
                                  child: Chip(
                                    backgroundColor: Color.fromARGB(228, 11, 71, 103),
                                    label: Text(
                                      t,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )))
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
