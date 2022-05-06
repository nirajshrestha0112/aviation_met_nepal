import 'package:aviation_met_nepal/widgets/custom_floating_action_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/general_icon.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GeneralIcon(),
        title: Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: const Text(
            "Notification",
          ),
        ),
      ),
      body: const NotificationBody(),
      floatingActionButton: const CustomFloatingActionBtn(),
    );
  }
}

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
