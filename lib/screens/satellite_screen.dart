import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/provider/satellite_image_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/values.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import '../widgets/custom_floating_action_btn.dart';
import '../widgets/custom_loading_indicator.dart';

class SatelliteScreen extends StatefulWidget {
  const SatelliteScreen({required this.screenName, Key? key}) : super(key: key);
  final String screenName;
  //

  @override
  State<SatelliteScreen> createState() => _SatelliteScreenState();
}

class _SatelliteScreenState extends State<SatelliteScreen> {
  @override
  void initState() {
    _future = Provider.of<SatelliteImageProvider>(context, listen: false)
        .postSatelliteImageDataData();
    super.initState();
  }

  late Future _future;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const CustomFloatingActionBtn(),
          body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    color: const Color(colorWhite),
                    height: SizeConfig.heightMultiplier * 6.5,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ListTile(
                            title: Text(
                          "Satellite Images",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: SizeConfig.textMultiplier * 2.2),
                        )),
                        Positioned(
                          top: SizeConfig.heightMultiplier * 2,
                          left: SizeConfig.widthMultiplier * 3.5,
                          child: GestureDetector(
                            child: Icon(
                              Icons.adaptive.arrow_back,
                              color: const Color(colorDarkBlue),
                              size: SizeConfig.imageSizeMultiplier * 6.0,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  FutureBuilder(
                      future: _future,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          {
                            return const CustomLoadingIndicator();
                          }
                        }
                        return InteractiveViewer(
                          // panEnabled: false, // Set it to false
                          boundaryMargin: const EdgeInsets.all(padding * 6.25),
                          minScale: 0.5,
                          maxScale: 2.5,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 1.2,
                            child: CachedNetworkImage(
                              imageUrl: Provider.of<SatelliteImageProvider>(
                                      context,
                                      listen: false)
                                  .satelliteImageData!
                                  .data!
                                  .files![0],
                            ),
                          ),
                        );
                      })
                  // : Text("No data found"),
                ])),
              ))),
    );
  }
}
