import 'dart:developer';
import 'dart:io';

import 'package:aviation_met_nepal/utils/secure_storage.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  static File? file;
  static FTPConnect? ftpConnect;

  static Future<void> _fileMock(String strFileName) async {
    final Directory? appDocDir = await getExternalStorageDirectory();
    if (appDocDir != null) {
      String appDocPath = appDocDir.path;
      file = File('$appDocPath/$strFileName');
      print('appDocPath : $appDocPath');
      print('file : $file');
    }
  }

  //connect FTP
  static connectionFTP() async {
    ftpConnect = FTPConnect("hydrology.gov.np",
        user: "aviego", pass: "aviegonasXcs#9", port: 21);
  }

//download file
  static Future<void> downloadFileFTP({
    required String filename,
    required String ftpFilename,
  }) async {
    try {
      if (ftpConnect == null) {
        log("message");
        await connectionFTP();
      }
      // bool bRes = await ftpConnect!.connect();
      await _fileMock(filename);

      final dir = ftpFilename.split("/");
      // print(dir);
      // print(await ftpConnect!.currentDirectory());
      for (var d in dir) {
        // if (d != dir.last) {
        await ftpConnect!.changeDirectory(d);
        log(await ftpConnect!.currentDirectory(), name: "current dir");
        // }
      }

      var dirData =
          await ftpConnect!.listDirectoryContent(cmd: DIR_LIST_COMMAND.MLSD);
      log("messageisGreat");
      // log(dirData.toString());

      List<FTPEntry> tempList = [];
      for (int i = 0; i < dirData.length; i++) {
        if (i > 1) {
          tempList.add(dirData[i]);
        }
      }

      tempList.sort((a, b) => b.modifyTime!.compareTo(a.modifyTime!));

      log(tempList.first.name.toString());
      await ftpConnect!.downloadFileWithRetry(
          tempList.first.name.toString(), file!,
          pRetryCount: 1);
      await SecureStorage.writeSecureData(
          key: 'filedownloaded', value: file.toString());
      await ftpConnect!.disconnect();
      print('file Name : ${file!}');
    } catch (e) {
      print('Error : ${e.toString()}');
    }
  }

  // Future<File> localFile(String pathName) async{
  //   final path=pathName;
  //   return File(path);
  // }
}
 

//download file

// import 'dart:io';

// import 'package:ftpclient/ftpclient.dart';
// import 'package:path_provider/path_provider.dart';

// class FileDownloader {
//   static late File file;
//   static late FTPClient ftpClient;
//   static Future<void> _fileMock(String strFileName) async {
//     final Directory? appDocDir = await getExternalStorageDirectory();
//     if (appDocDir != null) {
//       String appDocPath = appDocDir.path;
//       file = File('$appDocPath/$strFileName');
//       print('appDocPath : $appDocPath');
//       print('file : $file');
//     }
//   }

//   //connect FTP
//   static connectionFTP() async {
//     ftpClient = FTPClient("hydrology.gov.np",
//         user: "aviego", pass: "aviegonasXcs#9", port: 21);
//          print(ftpClient.listDirectoryContent());
//   }


// }
