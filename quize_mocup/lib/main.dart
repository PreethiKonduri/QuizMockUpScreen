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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              leading: Icon(
                Icons.menu,color: Colors.white,
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
                                    color: Color.fromRGBO(209, 221, 237, 1), fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              width: 90,
                              height: 90,
                              child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://source.unsplash.com/random")),
                            ),
                            Text(
                              "Rahul Vadya",
                              style: TextStyle(
                                  color: Color.fromRGBO(209, 221, 237, 1), fontSize: 20),
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
                                    color: Color.fromRGBO(209, 221, 237, 1), fontSize: 20),
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

            ),

//            Text("THis is Next")
          ];
        },
        body: Center(
          child:
              ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  ),
                  ListTile(
                    title: Text("Data 1"),
                    subtitle: Text("Sub 1"),
                  )
                ],
              ),

          ),
        ),
      );
      // This trailing comma makes auto-formatting nicer for build methods.

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
