import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BagDrawer extends Drawer {
  BagDrawer(BuildContext context)
      : super(
            child: ListView(
              children: [
                const DrawerHeader(
                    child: ListTile(
                        title: Text("Your Bag", textAlign: TextAlign.center))),
                ListTile(
                    leading: const Icon(
                      Icons.camera,
                      size: 70,
                    ),
                    title: const Text('Item'),
                    subtitle: const Text("Description"),
                    trailing: const Text("\$30.99"),
                    onTap: () {}),
              ],
            ),
            elevation: 8);
}
