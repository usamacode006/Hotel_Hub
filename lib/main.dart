import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_hub/GeneralManager/notes.dart';
import 'package:hotel_hub/Provider/notification_provider.dart';
import 'package:hotel_hub/User/user_home_page.dart';
import 'package:hotel_hub/assitant_general_manager/delete_agm.dart';
import 'package:hotel_hub/firebase_auth/authentication_wrapper.dart';
import 'package:hotel_hub/house_keeping_manager/display_meeting.dart';
import 'package:hotel_hub/request/assigned_long_request.dart';
import 'package:hotel_hub/request/create_request.dart';
import 'package:hotel_hub/request/request.dart';
import 'package:hotel_hub/request/show_long_request.dart';
import 'package:hotel_hub/room/add_room.dart';
import 'package:hotel_hub/room/display_rooms.dart';
import 'package:hotel_hub/room/display_rooms_for_event.dart';
import 'package:hotel_hub/room/status_selection.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'GeneralManager/custom_animations.dart';
import 'GeneralManager/gm_list.dart';
import 'GeneralManager/unassigned_gm.dart';
import 'admin/add_event.dart';
import 'house_keeping_manager/add_meeting.dart';
import 'admin/admin_categories.dart';
import 'admin/assign_departments.dart';
import 'admin/categories.dart';
import 'admin/chart_app.dart';
import 'admin/display_events.dart';
import 'admin/pick_date.dart';
import 'admin/send_notifications.dart';
import 'auth_screens/login.dart';
import 'auth_screens/register.dart';
import 'package:provider/provider.dart';
import 'global.dart' as globals;
import 'firebase_auth/authentication_service.dart';
import 'firebase_auth/user_vs_worker.dart';
import 'navigation_bar/navigationbar_provider.dart';

const String kAppId = '2c12c924-afff-47bd-89d3-5efef4eb7943';
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  globals.appNavigator = GlobalKey<NavigatorState>();
  runApp(const Myapp());
  configLoading();
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  void initState() {
    super.initState();
    configOneSignel();
  }

  void configOneSignel() {
    OneSignal.shared.setAppId(kAppId);
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      var data = openedResult.notification.additionalData;
      globals.appNavigator.currentState!
          .push(MaterialPageRoute(builder: (context) => Request()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
        ),
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        navigatorKey: globals.appNavigator,
        builder: EasyLoading.init(),
        home: AuthenticationWrapper(),
      ),
    );
  }
}
