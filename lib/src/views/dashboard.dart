import 'package:antry/src/views/qrScanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/customAppBar_dashboard.dart';
import '../provider/loginProvider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void dispose() {
    //final loginProvider =
    // Provider.of<LoginDataProvider>(context, listen: false);
    //  debugPrint(loginProvider.data?.data?.fullname);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider =
        Provider.of<LoginDataProvider>(context, listen: false);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(300), child: CustomAppBar()),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: const Color(0xffff725e),
          splashColor: Colors.grey,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QrScanner(),
              ),
            );
          },
          child: const Icon(
            Icons.qr_code_scanner,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      body: Theme(
        data: ThemeData(
          primaryColor: const Color(0xfff2735b),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20),
              child: Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Colors.white,
                ),
                child: const Text(
                  'Last Visited',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return true;
                },
                child: ListView(
                  children: <Widget>[
                    cardList(),
                    cardList(),
                    cardList(),
                    cardList(),
                    cardList(),
                    cardList(),
                    cardList(),
                    cardList(),
                    cardList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget cardList() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ListTile(
          //leading: Icon(Icons.person),
          title: const Text(
            'Library',
          ),
          subtitle: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              '21/11/22',
              style: TextStyle(fontSize: 12),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Column(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Colors.green,
                        ),
                        Text('11:00 AM'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.red,
                        ),
                        Text('13:00 PM'),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ),
  );
}
