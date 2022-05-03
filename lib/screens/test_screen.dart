// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:ftpconnect/ftpconnect.dart';
// import 'package:path_provider/path_provider.dart';

// class FileDownload extends ChangeNotifier{

//   late dynamic ftpConnect;
//   late dynamic file;
//  Future<void> _fileMock(String strFileName) async {
//     final Directory appDocDir  = await getApplicationDocumentsDirectory();
//     String appDocPath = appDocDir.path;
//     file = File('$appDocPath/$strFileName');
//     print('appDocPath : $appDocPath');
//     print('file : $file');
//     notifyListeners();
//   }

//   //connect FTP
//   connectionFTP() async {
//     ftpConnect = FTPConnect('hydrology.gov.np', user: 'aviego', pass: 'aviegonasXcs#9', port: 21);
//     notifyListeners();
//   }

// //download file
//   Future<void> downloadFileFTP() async{
//     try {
//       bool bRes = await ftpConnect!.connect();
//       _fileMock('/Meteorological Forecasting Division');
//       await ftpConnect!.downloadFileWithRetry('FL 390.gif', file!, pRetryCount: 1);
//       print('path2 : ${file!.path}');
//       await ftpConnect!.disconnect();

//       print('file Name : ${file!}');
//     }catch(e){
//       print('Error : ${e.toString()}');
//     }
//     notifyListeners();
//   }

// }