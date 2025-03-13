import 'package:fb_replication/widgets/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/newsfeed_screen.dart';
import '../screens/ProfileScreen.dart'; // Import ProfileScreen
import '../widgets/constant.dart';
import '../widgets/customfont.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String username = '';

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is String) {
      setState(() {
        username = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: FB_DARK_PRIMARY,
        elevation: 2,
        title: CustomFont(
          text: username,
          fontSize: ScreenUtil().setSp(15),
          color: FB_PRIMARY,
          fontFamily: 'Klavika',
          fontStyle: FontStyle.italic,
        ),
      ),
      body: _selectedIndex == 2
          ? const ProfileScreen() // Navigate directly to ProfileScreen
          : PageView(
              controller: _pageController,
              children: <Widget>[
                const NewsFeedScreen(), // Home/News Feed page
                Container(
                  padding: EdgeInsets.all(10.w),
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        NotificationWidget(
                          name: 'Phillip Casingal',
                          post: 'Posted: SKIBIDDI',
                          description: 'Check out the new viral trend!',
                          date: 'Today',
                          numOfLikes: 15,
                        ),
                        NotificationWidget(
                          name: 'John Doe',
                          post: 'Shared: Inspirational Quote',
                          description: 'Believe in yourself and all that you are!',
                          date: 'Yesterday',
                          numOfLikes: 20,
                        ),
                        NotificationWidget(
                          name: 'Jane Smith',
                          post: 'Commented on your photo',
                          description: 'Wow! That looks amazing!',
                          date: '2 days ago',
                          numOfLikes: 5,
                        ),
                        NotificationWidget(
                          name: 'Community Group',
                          post: 'Event: Cleanup Drive',
                          description: 'Join us this weekend for a community cleanup!',
                          date: '3 days ago',
                          numOfLikes: 30,
                        ),
                        NotificationWidget(
                          name: 'Emily Brown',
                          post: 'Liked your post',
                          description: 'Your post is getting popular!',
                          date: '4 days ago',
                          numOfLikes: 10,
                        ),
                        NotificationWidget(
                          name: 'Phillip Casingal',
                          post: 'Posted: Flutter Tutorial',
                          description: 'Learn how to build awesome apps with Flutter!',
                          date: 'A week ago',
                          numOfLikes: 50,
                        ),
                        NotificationWidget(
                          name: 'Kit Santiago',
                          post: 'Posted: Flutter Tutorial',
                          description: 'Learn how to build awesome apps with Flutter!',
                          date: 'A week ago',
                          numOfLikes: 50,
                        ),
                        NotificationWidget(
                          name: 'Rodney Estrada',
                          post: 'Posted: Flutter Tutorial',
                          description: 'Learn how to build awesome apps with Flutter!',
                          date: 'A week ago',
                          numOfLikes: 50,
                        ),
                        NotificationWidget(
                          name: 'Marlou Tobello',
                          post: 'Posted: Flutter Tutorial',
                          description: 'Learn how to build awesome apps with Flutter!',
                          date: 'A week ago',
                          numOfLikes: 50,
                        ),
                        NotificationWidget(
                          name: 'Gab Amido',
                          post: 'Posted: Flutter Tutorial',
                          description: 'Learn how to build awesome apps with Flutter!',
                          date: 'A week ago',
                          numOfLikes: 50,
                        ),
                      ],
                    ),
                  ),
                ), // Notification page
              ],
              onPageChanged: (page) {
                setState(() {
                  _selectedIndex = page;
                });
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        backgroundColor: FB_LIGHT_PRIMARY,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        selectedItemColor: FB_DARK_PRIMARY,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int index) {
    if (index == 3) {
      _showLogoutDialog(); // Handle logout separately
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {

              Navigator.pop(context); 
              Navigator.pushReplacementNamed(context, '/login'); 
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
