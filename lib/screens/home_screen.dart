import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> data = [
    {
      'icon': const ReusableIcon(icon: Icons.home),
      'title': const ReusableText(text: "Home")
    },
    {
      'icon': const ReusableIcon(icon: Icons.notification_add),
      'title': const ReusableText(text: "Notification")
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Discover",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor,
              fontSize: SizeConfig.textMultiplier! * 2.5,
              fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const ReusableIcon(
          icon: Icons.apps_sharp,
        ),
        onPressed: () {
          _showSheet();
        },
        elevation: 0.0,
      ),
      backgroundColor: bgColor,
      body: const HomeScreenBody(),
    );
  }

  void _showSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return Container(
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: padding / 1.5, vertical: padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.apps_sharp,
                            size: SizeConfig.imageSizeMultiplier! * 8.0,
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier,
                          ),
                          Text(
                            "Menu",
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier! * 2.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.close_outlined,
                        size: SizeConfig.imageSizeMultiplier! * 8.0,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (c, i) {
                        return SizedBox(
                          width: SizeConfig.widthMultiplier,
                        );
                      },
                      controller: controller,
                      itemCount: data.length,
                      itemBuilder: (c, i) {
                        return ListTile(
                            leading: data[i]['icon'], title: data[i]['title']);
                      }),
                ),
              ]),
            );
          },
        );
      },
    );
  }
}

class ReusableText extends StatelessWidget {
  final String text;
  const ReusableText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: SizeConfig.textMultiplier! * 2.2),
    );
  }
}

class ReusableIcon extends StatelessWidget {
  final IconData icon;
  const ReusableIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: SizeConfig.imageSizeMultiplier! * 10.0,
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        /* 
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min, */
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding * 1.2, vertical: padding * 1.5),
            child: TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding / 2.0),
                    hintText: "Select Airport",
                    hintStyle: TextStyle(
                        color: searchColor,
                        fontSize: SizeConfig.textMultiplier! * 2.0,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0)),
                    suffixIcon: Icon(
                      Icons.location_on,
                      color: iconColor,
                      size: SizeConfig.widthMultiplier! * 7.5,
                    ))),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  aiportImg,
                  width: SizeConfig.widthMultiplier! * 30,
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier! * 56.0,
                  height: SizeConfig.heightMultiplier! * 5.0,
                  child: Text(
                    "Please select the airport first to view detail readings",
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier! * 2.0,
                        color: textColor),
                  ),
                )
              ],
            ),
          ),
        ]);
  }
}
