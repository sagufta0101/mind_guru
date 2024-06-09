// import 'package:endurance_app/routes/route_constant.dart';
// import 'package:endurance_app/shared/widgets/custom_input.dart';
// import 'package:flutter/material.dart';

// import '../../../shared/widgets/custom_button.dart';
// import '../../../theme/colors.dart';
// import 'package:go_router/go_router.dart';

// class MobileNumberScreen extends StatelessWidget {
//   const MobileNumberScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController mobNo;

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraint) {
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: constraint.maxHeight * 0.1,
//                 ),
//                 Image.asset("assets/logos/cmp_logo.png"),
//                 SizedBox(height: constraint.maxHeight * 0.03),
//                 Text(
//                   "Login to Unlock Awesome New Features",
//                   style: Theme.of(context).textTheme.displaySmall,
//                   textAlign: TextAlign.left,
//                 ),
//                 SizedBox(height: constraint.maxHeight * 0.03),
//                 Text(
//                   "Mobile No*",
//                   style: Theme.of(context).textTheme.headlineSmall,
//                   textAlign: TextAlign.left,
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: constraint.maxWidth * 0.15,
//                       child: CustomInput(
//                         hintText: "+(91)",
//                         keyboardType: TextInputType.phone,
//                         readOnly: true,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10.0,
//                     ),
//                     SizedBox(
//                       width: constraint.maxWidth -
//                           (10 + constraint.maxWidth * 0.15 + 28 + 28),
//                       child: CustomInput(
//                         hintText: "994-393-4595",
//                         keyboardType: TextInputType.phone,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: constraint.maxHeight * 0.03),
//                 CustomElevatedButton(
//                     buttonText: "Send OTP",
//                     buttonColor: CustomColors.elevatedButtonColor,
//                     onPressed: () {
//                       context.go(AppRouteConstant.otpRoute);
//                     },
//                     style: Theme.of(context).textTheme.labelMedium),
//                 SizedBox(height: constraint.maxHeight * 0.03),
//                 Center(
//                   child: Text(
//                     "Your Existing Account",
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                 ),
//                 SizedBox(
//                   height: constraint.maxHeight * 0.03,
//                 ),
//                 CustomElevatedButton(
//                     buttonText: "Continue with Email",
//                     buttonColor: Colors.white,
//                     onPressed: () {},
//                     style: Theme.of(context).textTheme.labelSmall),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
