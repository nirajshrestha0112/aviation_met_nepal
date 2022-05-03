/* import 'package:aviation_met_nepal/file_downloader.dart';
import 'package:flutter/material.dart';

class SigwaxScreen extends StatelessWidget {
  const SigwaxScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(FileDownloader.file!),
        
      
    );
  }
} */
// import 'dart:html';

import 'dart:developer';

import 'package:aviation_met_nepal/file_downloader.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_floating_action_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/general_icon.dart';

class SigwaxScreen extends StatelessWidget {
  final String fileName;
  final String path;
  const SigwaxScreen({Key? key, required this.fileName, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(path);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: const GeneralIcon(),
            title: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: const Text(
                "Wind Chart Image",
              ),
            ),
          ),
          floatingActionButton: const CustomFloatingActionBtn(),
          body:  SigwaxScreenBody(fileName: fileName,path: path,)),
    );
  }
}

class SigwaxScreenBody extends StatefulWidget {
   final String fileName;
  final String path;
  const SigwaxScreenBody({
    Key? key, required this.fileName, required this.path,
  }) : super(key: key);

  @override
  State<SigwaxScreenBody> createState() => _SigwaxScreenBodyState();
}

class _SigwaxScreenBodyState extends State<SigwaxScreenBody> {
 /*  Future<void> _pulltoRefresh() async {
    setState(() {});
  } */
  /*  void initState() {
    _future = Provider.of<SatelliteImageProvider>(context, listen: false)
        .postSatelliteImageDataData();
    super.initState();
  } */

  // late Future _future;

  @override
  Widget build(BuildContext context) {
    FileDownloader windFiles = FileDownloader();
    return FutureBuilder(
        future: windFiles.downloadFileSigwxChart(
            filename:widget.fileName,
            ftpFilename:
                widget.path),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return InteractiveViewer(
                // panEnabled: false, // Set it to false
                boundaryMargin: EdgeInsets.all(100.w),
                minScale: 0.5,
                maxScale: 2.5,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: Image.file(windFiles.file!)),
              );
            }
            return const CustomErrorTab();
          }
          return const CustomLoadingIndicator();
        });
  }
}
