import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/sigmets_data_provider.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/airport_list_model.dart';
import '../utils/size_config.dart';

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
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Provider.of<SigmetsDataProvider>(context, listen: false)
                      .sigmetsData ==
                  null
              ? const Center(
                  child: CustomErrorTab(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: padding,
                      left: padding,
                      bottom: padding,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(radius)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SIGMETS Data",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.0,
                              fontWeight: FontWeight.w500,
                              color: colorBlue),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                        Consumer<SigmetsDataProvider>(builder: (_, value, __) {
                          return Text(
                            value.sigmetsData!.data!,
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2.0,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                          );
                        }),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
