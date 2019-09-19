import 'package:flutter/material.dart';
import 'package:quize_mocup/quizes.dart';
import 'package:quize_mocup/service_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quize_mocup/resource.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = false;
  List<String> reportList = [
    "Technology",
    "Arts",
    "General Awareness",
    "Sports",
    "History",
    "Entertainment"
  ];
  List<String> selectedReportList = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      //todo: filter data
                      print("Filter Data Widget");
                    })
              ],
              title: Text("Quizes"),
              expandedHeight: 250.0,
              leading: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                )
              ],
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "40",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(209, 221, 237, 1)),
                              ),
                              Text(
                                "Total",
                                style: TextStyle(
                                    color: Color.fromRGBO(209, 221, 237, 1),
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                              width: 90,
                              height: 90,
                              child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://source.unsplash.com/random")),
                            ),
                            Text(
                              "Rahul Vadya",
                              style: TextStyle(
                                  color: Color.fromRGBO(209, 221, 237, 1),
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "40",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(209, 221, 237, 1)),
                              ),
                              Text(
                                "Pending",
                                style: TextStyle(
                                    color: Color.fromRGBO(209, 221, 237, 1),
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

//          Image.network(
//          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
//          fit: BoxFit.cover,
//          )
                  ),
            )
//            Text("THis is Next")
          ];
        },
        body: Center(
          child: Container(
//              237, 240, 245
              color: Color.fromRGBO(237, 240, 245, 1),
              child: fetchQuizFromCloud()),
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip(this.reportList, {this.onSelectionChanged} // +added
      );

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: Color.fromRGBO(242, 218, 242, 1),
          disabledColor: Color.fromRGBO(185, 205, 237, 1),
          backgroundColor: Color.fromRGBO(185, 205, 237, 1),
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices); // +added
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class QuizListItemView extends StatefulWidget {
  Quizes quiz;

  QuizListItemView(this.quiz);

  @override
  _QuizListItemViewState createState() => _QuizListItemViewState(this.quiz);
}

class _QuizListItemViewState extends State<QuizListItemView> {
  Quizes quiz;

  _QuizListItemViewState(this.quiz);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(8, 0, 4, 8),
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    quiz.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                  child: Text(
                    //todo: get the array and map it to the custom model and fetch the array size
                    quiz.questions.length.toString() + " - Questions",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.pink),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.calendar_today,
                        size: 15,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat("dd-MM-yyyy")
                            .format(Timestamp.fromDate(
                                    quiz.activeTimePeriod['start'])
                                .toDate())
                            .toString(),
                        style: TextStyle(color: Colors.cyan),
                      ),
                    ),
                    Text("to", style: TextStyle(color: Colors.cyan)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          DateFormat("dd-MM-yyyy")
                              .format(Timestamp.fromDate(
                                      quiz.activeTimePeriod['end'])
                                  .toDate())
                              .toString(),
                          style: TextStyle(color: Colors.cyan)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Text(quiz.status),
          ),
        )
      ],
    );
  }
}
