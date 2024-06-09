import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/route_constant.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../theme/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                ),
                Image.asset("assets/logos/cmp_logo.png"),
                const Spacer(),
                Text(
                  "Get The Medicine Reminders",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "While these words can be related to fast food they suggest that can expect a sweet",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                ),
                CustomElevatedButton(
                    buttonText: "Get Started",
                    buttonColor: CustomColors.elevatedButtonColor,
                    onPressed: () {
                      Get.offAndToNamed(AppRoutes.login);
                    },
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
          );
        },
      ),
    );
  }
}
