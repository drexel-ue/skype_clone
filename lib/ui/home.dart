import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/utils/skype_colors.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SkypeColors.blackColor,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int page) => setState(() => _page = page),
        children: [
          Center(child: Text('Chat List Screen')),
          Center(child: Text('Call Logs')),
          Center(child: Text('Contact Screen')),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: CupertinoTabBar(
          backgroundColor: SkypeColors.blackColor,
          currentIndex: _page,
          onTap: (int page) => _pageController.animateToPage(page, duration: const Duration(milliseconds: 250), curve: Curves.easeOut),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                color: _page == 0 ? SkypeColors.lightBlueColor : SkypeColors.greyColor,
              ),
              title: Text(
                'Chats',
                style: TextStyle(
                  fontSize: 14,
                  color: _page == 0 ? SkypeColors.lightBlueColor : SkypeColors.greyColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.phone,
                color: _page == 1 ? SkypeColors.lightBlueColor : SkypeColors.greyColor,
              ),
              title: Text(
                'Calls',
                style: TextStyle(
                  fontSize: 14,
                  color: _page == 1 ? SkypeColors.lightBlueColor : SkypeColors.greyColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
                color: _page == 2 ? SkypeColors.lightBlueColor : SkypeColors.greyColor,
              ),
              title: Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 14,
                  color: _page == 2 ? SkypeColors.lightBlueColor : SkypeColors.greyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
