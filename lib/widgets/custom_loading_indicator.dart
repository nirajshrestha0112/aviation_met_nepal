import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: SizeConfig.imageSizeMultiplier * 8,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(padding * 2.0),
              child: Image.asset(
                // you can replace this with Image.asset
                logoOnlyImg,
                fit: BoxFit.cover,
                // height: SizeConfig.heightMultiplier * 3.0,
                width: SizeConfig.imageSizeMultiplier * 8.0,
              ),
            ),
          ),
          // you can replace
          const CircularProgressIndicator(
              // valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              // strokeWidth: 0.7,
              ),
        ],
      ),
    );
  }
}
