import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              leading: Icon(
                Icons.menu,
                color: Colors.white,
              ),
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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8.0),
                          child: ChoiceChip(
                            label: Text("Technology"),
//                          backgroundColor: Color.fromRGBO(185,205, 237, 1),
                            selectedColor: Color.fromRGBO(242, 218, 242, 1),
                            disabledColor: Color.fromRGBO(185, 205, 237, 1),
                            onSelected: (selected){
                              setState(() {
                                isSelected = selected;
                              });

                            },
                            selected: false,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(8.0),
                            child: ChoiceChip(
                              label: Text("Arts"),
//                          backgroundColor: Color.fromRGBO(242, 218, 242, 1),
                              selectedColor: Color.fromRGBO(242, 218, 242, 1),
                              disabledColor: Color.fromRGBO(242, 218, 242, 1),
                              selected: false,
                            )),
                        Container(
                            margin: EdgeInsets.all(8.0),
                            child: ChoiceChip(
                              label: Text("Entertainment"),
                              backgroundColor: Colors.amber,
                              selected: true,
                            )),
                        Container(
                            margin: EdgeInsets.all(8.0),
                            child: ChoiceChip(
                              label: Text("General Awareness"),
                              backgroundColor: Colors.amber,
                              selected: true,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),

//            Text("THis is Next")
          ];
        },
        body: Center(
          child: Container(
//              237, 240, 245
            color: Color.fromRGBO(237, 240, 245, 1),
            child: ListView(
              children: <Widget>[
                itemCard(),
                itemCard(),
                itemCard(),
                itemCard(),
                itemCard(),
                itemCard(),
                itemCard()

              ],
            ),
          ),
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Container itemCard() {
    return Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 4),
              child: Card(
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Flutter Basics",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,4,0,4),
                      child: Text("20 - Questions",style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.pink
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("To get analysis about the basic concepts observed by ordience",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.black
                      ),),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.calendar_today,size: 15,color: Colors.black54,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("26-05-2019",style: TextStyle(color: Colors.cyan),),
                        ),
                         Text("to",style: TextStyle(color: Colors.cyan)),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("30-05-2019",style: TextStyle(color: Colors.cyan)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
