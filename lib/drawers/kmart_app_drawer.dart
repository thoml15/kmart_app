import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kmart_app/constant.dart';
import 'package:kmart_app/views/home.dart';
import 'package:kmart_app/views/webview.dart';

class KmartAppDrawer extends Drawer {
  KmartAppDrawer(BuildContext context)
      : super(
            elevation: ELEVATION,
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                        heightFactor: 0.5,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: -8,
                          minLeadingWidth: 0,
                          title: SvgPicture.asset(
                            LOGO,
                            semanticsLabel: 'Logo',
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          subtitle: const Text('v1.0',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              )),
                        ))),
                ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    }),
                ListTile(
                    title: const Text('WebView'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WebView()));
                    }),
              ],
            ));
}
