import 'package:flutter/material.dart';
import 'package:kmart_app/constant.dart';

class SearchBar extends Container {
  SearchBar({Key? key})
      : super(
            padding: const EdgeInsets.all(PADDING_20),
            color: Colors.grey,
            child: Card(
                elevation: 4,
                child: TextFormField(
                    maxLines: 1,
                    decoration: const InputDecoration(
                        hintText: "search",
                        border: OutlineInputBorder(gapPadding: PADDING_20),
                        suffixIcon: Icon(Icons.search_rounded)))));
}
