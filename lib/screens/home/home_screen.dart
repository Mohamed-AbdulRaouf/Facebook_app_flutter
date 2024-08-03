import 'package:facebook_app/screens/home/home_screen_desktop.dart';
import 'package:facebook_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _trackingScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              HomeScreenDesktop(scrollController: _trackingScrollController),
          tablet: HomeScreenMobile(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}
