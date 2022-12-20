import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('TabBar Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
         
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
               color: Colors.grey,
              borderRadius: BorderRadius.circular(11)),
          child: Column(
            children: [
              Container(
               
                 decoration: BoxDecoration(
                   color: Colors.pink,
                   borderRadius: BorderRadius.circular(11)),
                child: TabBar(
                 
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  isScrollable: false,
                  dragStartBehavior: DragStartBehavior.down,
                  unselectedLabelStyle: const TextStyle(fontSize: 15),
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  controller: _tabController,
                  
                  tabs: const <Widget>[
                    Tab(
                      // icon: Icon(Icons.cloud_outlined),
                      text: 'Tab 1',
                    ),
                    // Tab(
                    //   icon: Icon(Icons.beach_access_sharp),
                    // ),
                    Tab(
                      // icon: Icon(Icons.brightness_5_sharp),
                      text: 'Tab 2',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const <Widget>[
                    Center(
                      child: Text("It's cloudy here"),
                    ),
                    // Center(
                    //   child: Text("It's rainy here"),
                    // ),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
