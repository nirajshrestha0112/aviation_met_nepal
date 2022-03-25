import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/provider/satellite_image_provider.dart';
import 'package:aviation_met_nepal/widgets/each_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/values.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import '../widgets/custom_floating_action_btn.dart';

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
          backgroundColor: bgColor,
          body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    color: Colors.white,
                    height: SizeConfig.heightMultiplier! * 6.5,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ListTile(
                            title: EachText(
                          text: widget.screenName,
                          textAlign: TextAlign.center,
                          fontSize: SizeConfig.textMultiplier! * 2.2,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        )),
                        Positioned(
                          top: SizeConfig.heightMultiplier! * 1.2,
                          left: SizeConfig.widthMultiplier,
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              size: SizeConfig.imageSizeMultiplier! * 7.5,
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
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
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
