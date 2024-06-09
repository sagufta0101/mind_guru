// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pinput/pinput.dart';

// import '../../../routes/route_constant.dart';
// import '../../../shared/widgets/custom_button.dart';
// import '../../../theme/colors.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   final pinController = TextEditingController();
//   final focusNode = FocusNode();
//   final _formKey = GlobalKey<FormState>();

//   int _secondsRemaining = 59;
//   Timer? _timer;
//   bool _timerEnded = false;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     pinController.dispose();
//     focusNode.dispose();
//     _timer!.cancel();
//     super.dispose();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondsRemaining > 0) {
//           _secondsRemaining--;
//         } else {
//           _timer!.cancel();
//           _timerEnded = true;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
//     const fillColor = Color.fromRGBO(243, 246, 249, 0);
//     const borderColor = Colors.black26;

//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 16,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(19),
//         border: Border.all(color: borderColor),
//       ),
//     );

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraint) {
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: constraint.maxHeight * 0.1,
//                   ),
//                   Text(
//                     "One Time Password",
//                     style: Theme.of(context).textTheme.displayLarge,
//                     textAlign: TextAlign.left,
//                   ),
//                   SizedBox(height: constraint.maxHeight * 0.03),
//                   Text(
//                     "Please enter 6-Digit Verification Code sent by SMS on your Mobile Number (+1) 254-393-4595",
//                     style: Theme.of(context).textTheme.displaySmall,
//                     textAlign: TextAlign.left,
//                   ),
//                   SizedBox(height: constraint.maxHeight * 0.08),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           "0:$_secondsRemaining",
//                           style: Theme.of(context).textTheme.headlineSmall,
//                           textAlign: TextAlign.end,
//                         ),
//                       ),
//                       Expanded(
//                           child: _timerEnded
//                               ? Align(
//                                   alignment: Alignment.centerRight,
//                                   child: TextButton(
//                                       onPressed: () {},
//                                       child: Text("Resend OTP",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headlineSmall!
//                                               .copyWith(
//                                                   decoration:
//                                                       TextDecoration.underline,
//                                                   color: Colors.red))),
//                                 )
//                               : const SizedBox()),
//                     ],
//                   ),
//                   SizedBox(height: constraint.maxHeight * 0.08),
//                   Text(
//                     "OTP*",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                     textAlign: TextAlign.left,
//                   ),
//                   const SizedBox(
//                     height: 16.0,
//                   ),
//                   Pinput(
//                     length: 6,
//                     controller: pinController,
//                     focusNode: focusNode,
//                     androidSmsAutofillMethod:
//                         AndroidSmsAutofillMethod.smsUserConsentApi,
//                     listenForMultipleSmsOnAndroid: true,
//                     defaultPinTheme: defaultPinTheme,
//                     // separatorBuilder: (index) => const SizedBox(width: 8),
//                     errorTextStyle:
//                         const TextStyle(fontSize: 15, color: Colors.red),
//                     validator: (value) {
//                       return value == '222222' ? null : 'Pin is incorrect';
//                     },
//                     // onClipboardFound: (value) {
//                     //   debugPrint('onClipboardFound: $value');
//                     //   pinController.setText(value);
//                     // },
//                     hapticFeedbackType: HapticFeedbackType.lightImpact,
//                     onCompleted: (pin) {
//                       debugPrint('onCompleted: $pin');
//                     },
//                     onChanged: (value) {
//                       debugPrint('onChanged: $value');
//                     },
//                     cursor: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(bottom: 9),
//                           width: 22,
//                           height: 1,
//                           color: focusedBorderColor,
//                         ),
//                       ],
//                     ),
//                     focusedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: focusedBorderColor),
//                       ),
//                     ),
//                     submittedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         color: fillColor,
//                         borderRadius: BorderRadius.circular(19),
//                         border: Border.all(color: focusedBorderColor),
//                       ),
//                     ),
//                     errorPinTheme: defaultPinTheme.copyBorderWith(
//                       border: Border.all(color: Colors.red),
//                     ),
//                   ),
//                   SizedBox(height: constraint.maxHeight * 0.03),
//                   CustomElevatedButton(
//                       buttonText: "Submit",
//                       buttonColor: CustomColors.elevatedButtonColor,
//                       onPressed: () {
//                         context.go(AppRouteConstant.landingRoute);
//                       },
//                       style: Theme.of(context).textTheme.labelMedium),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
