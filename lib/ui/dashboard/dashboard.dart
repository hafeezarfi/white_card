import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("White Card"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(),
                Text(
                  "H1 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Divider(),
                Text(
                  "H2 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Divider(),
                Text(
                    "H3 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: Theme.of(context).textTheme.headline3),
                Divider(),
                Text(
                  "H4Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Divider(),
                Text(
                  "H5 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Divider(),
                Text(
                  "H6 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Divider(),
                Text(
                  "Sub1 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Divider(),
                Text(
                  "Sub2 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Divider(),
                Text(
                  "Body1 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Divider(),
                Text(
                  "Body2 Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Divider(),
                Text(
                  "Button Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.button,
                ),
                Divider(),
                Text(
                  "Caption Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ), //
    );
  }
}
