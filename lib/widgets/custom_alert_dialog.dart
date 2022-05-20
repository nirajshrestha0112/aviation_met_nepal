import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/get_device_size.dart';

class ShowAlertDialogBox extends StatefulWidget {
  const ShowAlertDialogBox({
    Key? key,
    required this.message,
    required this.title,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  State<ShowAlertDialogBox> createState() => _ShowAlertDialogBoxState();
}

class _ShowAlertDialogBoxState extends State<ShowAlertDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = 20.h;
            var width = MediaQuery.of(context).size.width * 100;
            return SizedBox(
              height: DeviceUtil.isMobile ? height : 24.h,
              width: width,
              child: Text(widget.message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  )),
            );
          },
        ),
        title: Text(
          'Confirm to ${widget.title}',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        contentPadding: EdgeInsets.only(top: 8.h, left: 23.w),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.green[800],
                  ))),
          TextButton(
              onPressed: () {
                // willLeave=true;
                Navigator.of(context).pop(true);
              },
              child: Text('Yes',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.green[800],
                  ))),
        ]);
  }
}
