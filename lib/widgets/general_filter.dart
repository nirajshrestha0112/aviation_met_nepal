import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors_properties.dart';

class DropDownFilter extends StatefulWidget {
  const DropDownFilter({
    Key? key,
    required this.setValue,
  }) : super(key: key);

  final Function(String value) setValue;

  @override
  State<DropDownFilter> createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> {
  String selectedValue = "Most Recent";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: "Most Recent",
        child: Text("Most Recent"),
      ),
      const DropdownMenuItem(value: "1", child: Text("Past 1 Hours")),
      const DropdownMenuItem(value: "2", child: Text("Past 2 Hours")),
      const DropdownMenuItem(value: "3", child: Text("Past 3 Hours")),
      const DropdownMenuItem(value: "4", child: Text("Past 4 Hours")),
      const DropdownMenuItem(value: "5", child: Text("Past 5 Hours")),
      const DropdownMenuItem(value: "6", child: Text("Past 6 Hours")),
      const DropdownMenuItem(value: "12", child: Text("Past 12 Hours")),
      const DropdownMenuItem(value: "18", child: Text("Past 18 Hours")),
      const DropdownMenuItem(value: "24", child: Text("Past 24 Hours")),
      const DropdownMenuItem(value: "36", child: Text("Past 36 Hours")),
      const DropdownMenuItem(value: "48", child: Text("Past 48 Hours")),
      const DropdownMenuItem(value: "72", child: Text("Past 72 Hours")),
      const DropdownMenuItem(value: "96", child: Text("Past 96 Hours")),
      const DropdownMenuItem(value: "120", child: Text("Past 120 Hours")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          iconSize: !DeviceUtil.isMobile ? 30.w : 25.w,
          // menuMaxHeight: !DeviceUtil.isMobile ? 700.h : 500.h,
          itemHeight: !DeviceUtil.isMobile ? 50.h : null,

          elevation: 0,
          style: TextStyle(
              fontSize: 14.sp,
              color: const Color(textColor),
              fontWeight: FontWeight.w500),
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
