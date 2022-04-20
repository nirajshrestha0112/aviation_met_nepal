import 'package:aviation_met_nepal/provider/satellite_image_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/custom_scroll_behavior.dart';
import '../widgets/custom_floating_action_btn.dart';
import '../widgets/custom_loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/general_icon.dart';

class SatelliteScreen extends StatelessWidget {
  const SatelliteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: const GeneralIcon(),
            title: const Text(
              "Satellite Images",
            ),
            centerTitle: true,
          ),
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
                        return const CustomLoadingIndicator();
                      }
                    }
                    return InteractiveViewer(
                      // panEnabled: false, // Set it to false
                      boundaryMargin: EdgeInsets.all(100.w),
                      minScale: 0.5,
                      maxScale: 2.5,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: CachedNetworkImage(
                          imageUrl: Provider.of<SatelliteImageProvider>(context,
                                  listen: false)
                              .satelliteImageData!
                              .data!
                              .files![0],
                        ),
                      ),
                    );
                  })),
        ));
  }
}
