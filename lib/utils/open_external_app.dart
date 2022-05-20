import 'dart:developer';

import 'package:url_launcher/url_launcher_string.dart';

/// opens email, phone dialer
launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    log('Could not launch $url');
  }
}

/// converts text to email launchable url
String getEmailUrl({required String email}) {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
  );
  return params.toString();
}

/// converts text to phone launchable url
String getPhoneUrl({required String phone}) {
  final Uri params = Uri(
    scheme: 'tel',
    path: phone,
  );
  return params.toString();
}
