import 'package:fb_replication/screens/detail_screen.dart';
import 'package:fb_replication/screens/login_screen.dart';
import 'package:fb_replication/screens/register_screen.dart';
import 'package:fb_replication/screens/splash_screen.dart';

import '../screens/home_screen.dart';
import '../screens/newsfeed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
void main() {
  runApp(const FacebookReplicationSantiago());
}
 
class FacebookReplicationSantiago extends StatelessWidget {
  const FacebookReplicationSantiago({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replication Santiago',
          initialRoute: '/splash',
          routes: {
            '/newsfeed': ((context) => const NewsFeedScreen()),
            '/home': (context) => const HomeScreen(),
            '/register': (context) => const RegisterScreen(),
            '/login': (context) => const LogInScreen(),
            '/splash': (context) =>const SplashScreen(),
            '/detail': (context) =>
                DetailScreen(userName: '', postContent: '', date: ''),
          },
        );
      },
    );
  }
}