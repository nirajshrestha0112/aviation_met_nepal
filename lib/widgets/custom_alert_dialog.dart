import 'package:flutter/material.dart';

import '../constant/values.dart';
import '../utils/size_config.dart';

class ShowAlertDialogBox extends StatefulWidget {
  const ShowAlertDialogBox({
    Key? key,
  }) : super(key: key);

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
            var height = SizeConfig.heightMultiplier * 5.0;
            var width = SizeConfig.widthMultiplier * 100.0;
            return SizedBox(
              height: height,
              width: width,
              child: Text("Are you sure you want to exit?",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: Colors.black,
                  )),
            );
          },
        ),
        title: Text(
          'Confirm to Exit',
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2.2,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        contentPadding:
            const EdgeInsets.only(top: padding / 2.0, left: padding * 1.5),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: Colors.green[800],
                  ))),
          TextButton(
              onPressed: () {
                // willLeave=true;
                Navigator.of(context).pop(true);
              },
              child: Text('Yes',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: Colors.green[800],
                  ))),
        ]);
  }
}
