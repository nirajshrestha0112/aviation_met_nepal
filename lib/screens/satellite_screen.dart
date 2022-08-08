import 'package:aviation_met_nepal/provider/satellite_image_provider.dart';
import 'package:aviation_met_nepal/widgets/custom_app_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constant/constants.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/get_device_size.dart';
import '../widgets/custom_floating_action_btn.dart';

class SatelliteScreen extends StatelessWidget {
  const SatelliteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(text: "Satellite Images"),
          floatingActionButton: const CustomFloatingActionBtn(),
          body: const SatelliteScreenBody()),
    );
  }
}

class SatelliteScreenBody extends StatefulWidget {
  const SatelliteScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SatelliteScreenBody> createState() => _SatelliteScreenBodyState();
}

class _SatelliteScreenBodyState extends State<SatelliteScreenBody> {
  @override
  void initState() {
    _future = Provider.of<SatelliteImageProvider>(context, listen: false)
        .postSatelliteImageDataData();
    super.initState();
  }

  late Future _future;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: MyBehavior(),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
              child: FutureBuilder(
                  future: _future,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 1.3,
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()),
                        );
                      }
                    }

                    return Provider.of<SatelliteImageProvider>(context,
                                        listen: false)
                                    .satelliteImageData
                                    ?.data
                                    ?.files?.length!=
                                0
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: RichText(
                                    text: TextSpan(
                                        text: "Date Taken :",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                        children: [
                                      TextSpan(
                                          text: DateFormat(dateFormat).format(
                                              DateTime.parse(Provider.of<
                                                          SatelliteImageProvider>(
                                                      context)
                                                  .satelliteImageData!
                                                  .data!
                                                  .date
                                                  .toString())))
                                    ])),
                              ),
                              InteractiveViewer(
                                // panEnabled: false, // Set it to false
                                boundaryMargin: EdgeInsets.all(100.w),
                                minScale: 0.5,
                                maxScale: 2.5,
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.2,
                                  child: CachedNetworkImage(
                                    errorWidget: ((context, url, error) => Center(child: Text(error),)),
                                    imageUrl:
                                        Provider.of<SatelliteImageProvider>(
                                                context,
                                                listen: false)
                                            .satelliteImageData!
                                            .data!
                                            .files![0],
                                          
                                  ),
                                ),
                              ),
                            ],
                          )
                        : CustomErrorTab(
                            height: DeviceUtil.isMobile ? 230.h : 300.h,
                          );
                  })),
        ));
  }
}
