import 'dart:developer';
import 'dart:io';

import 'package:aviation_met_nepal/constant/constants.dart';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/utils/secure_storage.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  File? file;
  FTPConnect? ftpConnect;

  Future<void> _fileMock(String strFileName) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    file = File('$appDocPath/$strFileName');
    // log('appDocPath : $appDocPath');
    // log('file : $file');
  }

  //connect FTP
  connectionFTP() async {
    ftpConnect = FTPConnect(ftpBaseUrl,
        user: ftpUsername, pass: ftpPassword, port: ftpPort);
    // log("ftp connected");
  }

//download file
  Future downloadFileWindChart({
    required String filename,
    required String ftpFilename,
  }) async {
    try {
      if (ftpConnect == null) {
        // log("message");
        await connectionFTP();
      }
      await ftpConnect!.connect();
      await _fileMock(filename);

      final dir = ftpFilename.split("/");

      // log(await ftpConnect!.currentDirectory());
      for (var d in dir) {
        await ftpConnect!.changeDirectory(d);
        // log(await ftpConnect!.currentDirectory(), name: "current dir");
      }
      var dirData =
          await ftpConnect!.listDirectoryContent(cmd: DIR_LIST_COMMAND.MLSD);
      // log("messageisGreat");
      // log(dirData.toString());
      List<FTPEntry> tempList = [];
      for (int i = 0; i < dirData.length; i++) {
        if (i > 1) {
          tempList.add(dirData[i]);
        }
      }
      tempList.sort((a, b) => b.modifyTime!.compareTo(a.modifyTime!));
      // log(tempList.first.name.toString());
      await ftpConnect!.downloadFileWithRetry(
          tempList.first.name.toString(), file!,
          pRetryCount: 1);
      await SecureStorage.writeSecureData(
          key: 'filedownloaded', value: file.toString());
      await ftpConnect!.disconnect();
      return file!;
    } catch (e) {
      log('Error : ${e.toString()}');
    }
  }

  Future downloadFileSigwxChart({
    required String filename,
    required String ftpFilename,
  }) async {
    try {
      if (ftpConnect == null) {
        log("message");
        await connectionFTP();
      }
      await ftpConnect!.connect();
      await _fileMock(filename);
      final dir = ftpFilename.split("/");
      log(dir.toString());
      log(await ftpConnect!.currentDirectory());
      for (var d in dir) {
        await ftpConnect!.changeDirectory(d);
        log(await ftpConnect!.currentDirectory(), name: "current dir");
      }
      var dirData =
          await ftpConnect!.listDirectoryContent(cmd: DIR_LIST_COMMAND.MLSD);
      log("messageisGreat");
      List<FTPEntry> tempList = [];
      for (int i = 0; i < dirData.length; i++) {
        if (i > 1) {
          tempList.add(dirData[i]);
        }
      }
      tempList.removeWhere((element) => (element.name!.contains('.SIG')));
      tempList.sort((a, b) => b.modifyTime!.compareTo(a.modifyTime!));
      log(tempList.first.name.toString());
      await ftpConnect!.downloadFileWithRetry(
          tempList.first.name.toString(), file!,
          pRetryCount: 1);
      await ftpConnect!.disconnect();
      return file!;
    } catch (e) {
      log('Error : ${e.toString()}');
    }
  }
}
