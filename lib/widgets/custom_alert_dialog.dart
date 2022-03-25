import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:flutter/material.dart';

import '../constant/values.dart';
import '../utils/size_config.dart';

class ShowAlertDialogBox extends StatelessWidget {
  const ShowAlertDialogBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        // insetPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(
          'Confirm to Exit',
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier! * 2.0,
              color: Colors.black,
              fontWeight: FontWeight.normal),
        ),
        content: Text("Are you sure you want to exit?",
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier! * 1.8,
              color: Colors.black,
            )),
        contentPadding:
            const EdgeInsets.only(top: padding / 2.0, left: padding * 1.5),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier! * 1.8,
                    color: Colors.green,
                  ))),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, homeScreen);
              },
              child: Text('Yes',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier! * 1.8,
                    color: Colors.green,
                  ))),
        ]);
  }
}
