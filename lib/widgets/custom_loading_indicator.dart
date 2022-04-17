import 'package:aviation_met_nepal/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 19.w,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.w * 2.0),
              child: Image.asset(
                // you can replace this with Image.asset
                logoOnlyImg,
                fit: BoxFit.cover,
                // height: SizeConfig.heightMultiplier * 3.0,
                width: 30.w,
              ),
            ),
          ),
          // you can replace
          const CircularProgressIndicator(
              // valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              strokeWidth: 4.5),
        ],
      ),
    );
  }
}
