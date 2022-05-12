import 'dart:developer';
import 'package:aviation_met_nepal/widgets/custom_app_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/get_device_size.dart';
import '../widgets/custom_floating_action_btn.dart';

class SigwaxDetailsScreen extends StatelessWidget {
  final String fileName;
  final String path;
  const SigwaxDetailsScreen(
      {Key? key, required this.fileName, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(path);
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(text: "SIGWX Chart"),
          floatingActionButton: const CustomFloatingActionBtn(),
          body: SigwaxDetailsScreenBody(
            fileName: fileName,
            path: path,
          )),
    );
  }
}

class SigwaxDetailsScreenBody extends StatefulWidget {
  final String fileName;
  final String path;
  const SigwaxDetailsScreenBody({
    Key? key,
    required this.fileName,
    required this.path,
  }) : super(key: key);

  @override
  State<SigwaxDetailsScreenBody> createState() =>
      _SigwaxDetailsScreenBodyState();
}

class _SigwaxDetailsScreenBodyState extends State<SigwaxDetailsScreenBody> {
  @override
  Widget build(BuildContext context) {
    FileDownloader sigwxImageFiles = FileDownloader();
    return FutureBuilder(
        future: sigwxImageFiles.downloadFileSigwxChart(
            filename: widget.fileName, ftpFilename: widget.path),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return InteractiveViewer(
                boundaryMargin: EdgeInsets.all(100.w),
                minScale: 0.5,
                maxScale: 2.5,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: Image.file(sigwxImageFiles.file!)),
              );
            }
            return CustomErrorTab(
              height: DeviceUtil.isMobile ? 230.h : 300.h,
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        });
  }
}
