import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class DropDownFilter extends StatefulWidget {
  const DropDownFilter({
    Key? key,
    required this.setValue,
  }) : super(key: key);

  final Function(String value) setValue;

  @override
  _DropDownFilterState createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> {
  String selectedValue = "Most Recent";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        child: Text("Most Recent"),
        value: "Most Recent",
      ),
      const DropdownMenuItem(child: Text("Past 1 Hours"), value: "1"),
      const DropdownMenuItem(child: Text("Past 2 Hours"), value: "2"),
      const DropdownMenuItem(child: Text("Past 3 Hours"), value: "3"),
      const DropdownMenuItem(child: Text("Past 4 Hours"), value: "4"),
      const DropdownMenuItem(child: Text("Past 5 Hours"), value: "5"),
      const DropdownMenuItem(child: Text("Past 6 Hours"), value: "6"),
      const DropdownMenuItem(child: Text("Past 12 Hours"), value: "12"),
      const DropdownMenuItem(child: Text("Past 18 Hours"), value: "18"),
      const DropdownMenuItem(child: Text("Past 24 Hours"), value: "24"),
      const DropdownMenuItem(child: Text("Past 36 Hours"), value: "36"),
      const DropdownMenuItem(child: Text("Past 48 Hours"), value: "48"),
      const DropdownMenuItem(child: Text("Past 72 Hours"), value: "72"),
      const DropdownMenuItem(child: Text("Past 96 Hours"), value: "96"),
      const DropdownMenuItem(child: Text("Past 120 Hours"), value: "120"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          menuMaxHeight: SizeConfig.heightMultiplier * 70.0,
          elevation: 0,
          isExpanded: true,
          value: selectedValue,
          items: dropdownItems,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
              widget.setValue(newValue);
            });
          },
        ),
      ),
    );
  }
}
