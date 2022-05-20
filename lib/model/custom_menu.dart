import 'package:aviation_met_nepal/widgets/each_text.dart';

class CustomMenu {
  final icon;
  final EachText title;
  final String navigateTo;
  final bool needLogin;
  final bool needToOpenUrl;
  final bool isHome;

  CustomMenu(
      {required this.icon,
      required this.title,
      required this.navigateTo,
      this.needLogin = false,
      this.needToOpenUrl = false,
      this.isHome = false});
}
