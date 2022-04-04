import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // lable one
  const MyApp({Key? key}) : super(key: key);

  // program dalam langsung diunduh dan dijalankan pada laptop, tanpa adanya kesalahan error

  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

MaterialApp Main() {
  final List cakes = [
    "cake_1",
    "cake_2",
    "cake_3",
    "cake_4",
    "cake_5",
    "cake_6",
    "cake_7",
    "cake_8",
    "cake_9",
    "cake_10",
  ];

  final List coffees = [
    "cofe_1",
    "cofe_2",
    "cofe_3",
    "cofe_4",
    "cofe_5",
    "cofe_6",
    "cofe_7",
    "cofe_8",
    "cofe_9",
    "cofe_10",
  ];

  final List icream = [
    "icream_1",
    "icream_2",
    "icream_3",
    "icream_4",
    "icream_5",
    "icream_6",
    "icream_7",
    "icream_8",
    "icream_9",
    "icream_10",
  ];

  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Color.fromARGB(255, 0, 204, 255),
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color.fromARGB(255, 0, 204, 255),
                        ),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Text("HAPPY CAFE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            )),
                      ),
                      background: Image(
                        image: AssetImage('assets/images/banner.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        indicatorColor: Colors.pink,
                        tabs: [
                          new Tab(icon: new Icon(Icons.cake_rounded), text: "Cake"),
                          new Tab(icon: new Icon(Icons.free_breakfast_rounded), text: "Coffee"),
                          new Tab(icon: new Icon(Icons.icecream), text: "Ice Cream"),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Expanded(
                child: Container(
                  child: TabBarView(children: [
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text("Menu Cake", style: TextStyle(fontSize: 14)),
                              contentPadding: EdgeInsets.all(20),
                              subtitle: Text('Deskripsi menu ' + cakes[index]),
                              leading: Container(
                                child: Image.asset("assets/images/" + cakes[index] + ".jpg"),
                              ),
                            ),
                          );
                        },
                        itemCount: cakes.length,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text("Menu Coffee", style: TextStyle(fontSize: 14)),
                              contentPadding: EdgeInsets.all(20),
                              subtitle: Text('Deskripsi menu ' + coffees[index]),
                              leading: Container(
                                child: Image.asset("assets/images/" + coffees[index] + ".jpg"),
                              ),
                            ),
                          );
                        },
                        itemCount: coffees.length,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text("Menu Ice Cream", style: TextStyle(fontSize: 14)),
                              contentPadding: EdgeInsets.all(20),
                              subtitle: Text('Deskripsi menu ' + icream[index]),
                              leading: Container(
                                child: Image.asset("assets/images/" + icream[index] + ".jpg"),
                              ),
                            ),
                          );
                        },
                        itemCount: coffees.length,
                      ),
                    ),
                  ]),
                ),
              ),
            )),
      ));
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
