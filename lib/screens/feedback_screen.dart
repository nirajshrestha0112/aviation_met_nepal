/* import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_textfield.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: SizeConfig.widthMultiplier * 6,
        leading: Padding(
          padding: const EdgeInsets.only(left: radius),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_sharp,
            ),
          ),
        ),
        title: const Text(
          "Feedback",
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding, vertical: padding),
            child: Column(
              children: [
                Image.asset(feedbackRocketImg,
                    width: SizeConfig.widthMultiplier * 50.0,
                    height: SizeConfig.widthMultiplier * 50.0),
                const GeneralTextField(
                  obscureText: false,
                  hintText: "Your Full Name",
                  keyboard: TextInputType.text,
                  icons: Icons.person,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
                const GeneralTextField(
                    obscureText: false,
                    hintText: "Email Address",
                    keyboard: TextInputType.emailAddress,
                    icons: Icons.email_outlined),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
                Container(
                    height: SizeConfig.heightMultiplier * 30.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your feedback here",
                        hintStyle: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.3,
                        ),
                      ),
                    )),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
                GeneralTextButton(
                  color: true,
                  onPressed: () {},
                  text: "Submit",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */

// import 'package:flutter/material.dart';

// class FeedBackRoute extends StatefulWidget {
//   const FeedBackRoute({Key? key}) : super(key: key);

//   @override
//   State<FeedBackRoute> createState() => _FeedBackRouteState();
// }

// class _FeedBackRouteState extends State<FeedBackRoute> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: TextButton(onPressed: () async {
//       const url = 'https://blog.logrocket.com';
//     }, child: sh,));
//   }
// }
