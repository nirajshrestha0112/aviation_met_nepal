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
  /*  bool isSuccessFromApi = false;

  bool isLoading = false;

  void apiCall() {
    setState(() {
      isLoading = true;
    });
    Provider.of<LoginProvider>(context, listen: false).clearLoginDetails();
    CircularProgressIndicator.adaptive();
    //call the api
    //after success or failure
    setState(() {
      isLoading = false;
      isSuccessFromApi = true;
    });
  } */
// bool willLeave = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        // insetPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(
          'Confirm to Exit',
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2.0,
              color: Colors.black,
              fontWeight: FontWeight.normal),
        ),
        content: Text("Are you sure you want to exit?",
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.8,
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
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: Colors.green,
                  ))),
          TextButton(
              onPressed: () {
                // willLeave=true;
                Navigator.of(context).pop(true);
              },
              child: Text('Yes',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: Colors.green,
                  ))),
        ]);
  }
}
