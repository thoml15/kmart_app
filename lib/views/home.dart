import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kmart_app/appbars/kmart_app_bar.dart';
import 'package:kmart_app/constant.dart';
import 'package:kmart_app/drawers/bag_drawer.dart';
import 'package:kmart_app/inputs/search_bar.dart';
import 'package:kmart_app/views/hidden_webview.dart';
import 'package:kmart_app/web/web_client.dart';

import '../drawers/kmart_app_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<String> homePage;

  @override
  void initState() {
    super.initState();
    homePage = WebClient().fetchHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KmartAppBar(context),
        drawer: KmartAppDrawer(context),
        endDrawer: BagDrawer(context),
        body: ListView(
          padding: const EdgeInsets.only(bottom: PADDING_10),
          children: <Widget>[
            SearchBar(),
            HiddenWebview((string) {}),
            Center(
                child: FutureBuilder<String>(
              future: homePage,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return Html(data: snapshot.data!);
                  }
                }
                return const Center(
                    heightFactor: 1,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ));
              },
            ))
          ],
        ));
  }
}
