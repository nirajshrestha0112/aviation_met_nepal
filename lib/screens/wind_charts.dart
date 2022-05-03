import 'package:aviation_met_nepal/file_downloader.dart';
import 'package:flutter/material.dart';

class WindChartScreen extends StatelessWidget {
  const WindChartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(FileDownloader.file!),
        
      
    );
  }
}