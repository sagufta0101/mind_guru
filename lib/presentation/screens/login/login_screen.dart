import 'package:endurance_app/shared/widgets/custom_button.dart';
import 'package:endurance_app/shared/widgets/custom_input.dart';
import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraint.maxHeight * 0.1,
                ),
                Text(
                  "Welcome Back.!",
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: constraint.maxHeight * 0.03),
                Text(
                  "Please Enter Your Credentials in the Form Below..!",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: constraint.maxHeight * 0.08),
                Text(
                  "Email or Mobile No*",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: constraint.maxHeight * 0.005),
                CustomInput(
                  hintText: "orozcoe444@example.com",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: constraint.maxHeight * 0.04),
                Text(
                  "Password*",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: constraint.maxHeight * 0.005),
                CustomInput(
                  hintText: "********",
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: constraint.maxHeight * 0.04),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password ?",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: constraint.maxHeight * 0.05),
                CustomElevatedButton(
                    buttonText:
                        "Login                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ",
                    buttonColor: CustomColors.elevatedButtonColor,
                    onPressed: () {},
                    style: Theme.of(context).textTheme.labelMedium),
                Text(
                  "Don’t Have An Account? Register",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
