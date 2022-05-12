import 'package:aviation_met_nepal/widgets/custom_app_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_floating_action_btn.dart';
import 'package:flutter/material.dart';

class IcingTurbulenceScreen extends StatelessWidget {
  const IcingTurbulenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Icing Turbulence Images"),
      body: const IcingTurbulenceScreenBody(),
      floatingActionButton: const CustomFloatingActionBtn(),
    );
  }
}

class IcingTurbulenceScreenBody extends StatelessWidget {
  const IcingTurbulenceScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
