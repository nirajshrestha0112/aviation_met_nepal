/* import 'package:aviation_met_nepal/file_downloader.dart';
import 'package:flutter/material.dart';

class SigwaxDetailsScreen extends StatelessWidget {
  const SigwaxDetailsScreen({ Key? key }) : super(key: key);

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

class SigwaxDetailsScreen extends StatelessWidget {
  final String fileName;
  final String path;
  const SigwaxDetailsScreen({Key? key, required this.fileName, required this.path}) : super(key: key);

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
                "Sigwx Chart Image",
              ),
            ),
          ),
          floatingActionButton: const CustomFloatingActionBtn(),
          body:  SigwaxDetailsScreenBody(fileName: fileName,path: path,)),
    );
  }
}

class SigwaxDetailsScreenBody extends StatefulWidget {
   final String fileName;
  final String path;
  const SigwaxDetailsScreenBody({
    Key? key, required this.fileName, required this.path,
  }) : super(key: key);

  @override
  State<SigwaxDetailsScreenBody> createState() => _SigwaxDetailsScreenBodyState();
}

class _SigwaxDetailsScreenBodyState extends State<SigwaxDetailsScreenBody> {
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
    FileDownloader sigwxImageFiles = FileDownloader();
    return FutureBuilder(
        future: sigwxImageFiles.downloadFileSigwxChart(
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
                    child: Image.file(sigwxImageFiles.file!)),
              );
            }
            return const CustomErrorTab();
          }
          return const CustomLoadingIndicator();
        });
  }
}
