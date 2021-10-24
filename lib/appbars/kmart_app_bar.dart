import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class KmartAppBar extends AppBar {
  KmartAppBar(BuildContext context)
      : super(
            elevation: ELEVATION,
            title: SvgPicture.asset(LOGO, semanticsLabel: 'Logo'),
            leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu_rounded))),
            actions: [
              Builder(
                  builder: (context) => IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_outlined),
                      )),
              Builder(
                  builder: (context) => IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      )),
              Builder(
                  builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(Icons.shopping_bag_outlined),
                      )),
            ]);
}
