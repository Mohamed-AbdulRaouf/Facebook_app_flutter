import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _screens.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100.0),
                  child: CustomAppbar(
                      selectedIndex: _selectedIndex,
                      currentUser: currentUser,
                      icons: _icons,
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }))
              : null,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          // for web and keep current position screen
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: CustomTabBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap: (index) => setState(() {
                        _selectedIndex = index;
                      }),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ));
  }
}
