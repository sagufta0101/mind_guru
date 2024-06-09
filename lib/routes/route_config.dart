// import 'package:endurance_app/presentation/screens/appointment/list_appointment.dart';
// import 'package:endurance_app/presentation/screens/login/login.dart';
// import 'package:endurance_app/presentation/screens/navigation/navigation.dart';
// import 'package:endurance_app/presentation/screens/otp/mobile_number.dart';
// import 'package:endurance_app/presentation/screens/otp/otp.dart';
// import 'package:endurance_app/routes/route_constant.dart';
// import 'package:go_router/go_router.dart';

// import '../presentation/screens/notes/notes_page.dart';

// class AppRoutes {
//   final GoRouter router = GoRouter(
//     initialLocation: AppRouteConstant.login,
//     debugLogDiagnostics: true,
//     routes: [
//       GoRoute(
//         path: AppRouteConstant.login,
//         builder: (context, state) {
//           return const LoginScreen();
//         },
//       ),
//       GoRoute(
//         path: AppRouteConstant.listAppointment,
//         builder: (context, state) {
//           return const ListAppointment();
//         },
//       ),
//       // GoRoute(
//       //   path: AppRouteConstant.inputMobRoute,
//       //   builder: (context, state) {
//       //     return const MobileNumberScreen();
//       //   },
//       // ),
//       GoRoute(
//         path: AppRouteConstant.otpRoute,
//         builder: (context, state) {
//           return const OtpScreen();
//         },
//       ),
//       GoRoute(
//         path: AppRouteConstant.landingRoute,
//         builder: (context, state) {
//           return const Navigation();
//         },
//       ),
//       GoRoute(
//         path: AppRouteConstant.noteRoute,
//         builder: (context, state) {
//           return NotesPage();
//         },
//       ),
//     ],
//   );
// }
