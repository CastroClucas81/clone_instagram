import 'package:clone_instagram/pages/home_page.dart';
import 'package:clone_instagram/pages/search_page.dart';
import 'package:clone_instagram/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      //header
      appBar: getAppBar(),
      //body
      body: getBody(),
      //footer
      bottomNavigationBar: getFooter(),
    );
  }

  //body - content
  getBody() {
    List<Widget> pages = [
      HomePage(),
      SearchPage(),
      Center(
        child: Text(
          'Search Page',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          'Upload Page',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          'Activity Page',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          'Account Page',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  //header menu
  getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/camera_icon.svg",
              width: 30,
            ),
            Text(
              'Instagram',
              style: TextStyle(fontFamily: 'billabong', fontSize: 35),
            ),
            SvgPicture.asset(
              "assets/images/message_icon.svg",
              width: 30,
            ),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Center(child: Text("Upload")),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Center(child: Text("Activity")),
      );
    } else if (pageIndex == 4) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Center(child: Text("Account")),
      );
    }
  }

  //footer menu
  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(color: appFooterColor),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 27,
                ),
              );
            }),
          ),
        ));
  }

  //hover footer buttons
  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
