import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/provider/sigmets_data_provider.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/airport_list.dart';
import '../utils/get_device_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigmetsTab extends StatefulWidget {
  const SigmetsTab({required this.sigmetsTabData, Key? key}) : super(key: key);
  final Data? sigmetsTabData;

  @override
  State<SigmetsTab> createState() => _SigmetsTabState();
}

class _SigmetsTabState extends State<SigmetsTab> {
  @override
  void initState() {
    _future = Provider.of<SigmetsDataProvider>(context, listen: false)
        .postSigmetsData(ident: widget.sigmetsTabData!.ident);

    super.initState();
  }

  late Future _future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return Provider.of<SigmetsDataProvider>(context, listen: false)
                    .sigmetsData !=
                null
            ? SingleChildScrollView(
                child: Container(
                  margin:  EdgeInsets.symmetric(
                      vertical: 16.h, horizontal: 16.w),
                  padding:  EdgeInsets.only(
                    top: 16.h,
                    left: 16.w,
                    bottom: 16.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SIGMETS Data",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: colorBlue),
                      ),
                      SizedBox(height: 4.h),
                      Consumer<SigmetsDataProvider>(builder: (_, value, __) {
                        return Text(
                          value.sigmetsData!.data!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.sp),
                        );
                      }),
                    ],
                  ),
                ),
              )
            : CustomErrorTab(
                margin: EdgeInsets.only(bottom: DeviceUtil.isMobile?430.h:350.h),
              );
      },
    );
  }
}
