import 'package:flutter/material.dart';

import '../../consts/vars.dart';

class NewsDropDown extends StatefulWidget {
  const NewsDropDown({super.key});

  @override
  State<NewsDropDown> createState() => _NewsDropDownState();
}

class _NewsDropDownState extends State<NewsDropDown> {
  String sortBy = SortItem.popular.name;

  List<DropdownMenuItem<String>> get dropDownItem {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortItem.popular.name,
        child: Text(SortItem.popular.name),
      ),
      DropdownMenuItem(
        value: SortItem.relevnet.name,
        child: Text(SortItem.relevnet.name),
      ),
      DropdownMenuItem(
        value: SortItem.latest.name,
        child: Text(SortItem.latest.name),
      ),
    ];
    return menuItem;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: Colors.lightGreen[700],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: DropdownButton(
              value: sortBy,
              items: dropDownItem,
              onChanged: (String? value) {
                setState(() {
                  sortBy = value.toString();
                });
              }),
        ),
      ),
    );
  }
}
