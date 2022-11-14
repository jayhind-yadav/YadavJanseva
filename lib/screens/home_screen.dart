import 'package:flutter/material.dart';
import 'package:yjs_kendra/screens/home.dart';
import 'package:yjs_kendra/screens/profile.dart';
import 'package:yjs_kendra/screens/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 130.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 10.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 10.0,
                  ),
                ],
                /* gradient: LinearGradient(
                    colors: [
                     // gradientStartColor,
                     // gradientEndColor
                    ],
                    begin: const FractionalOffset(0.2, 0.2),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),*/
              ),
              child: Center(
                child: Image(
                  image: AssetImage('lib/assets/images/csc.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Services(),
          Home(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).bottomAppBarColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          elevation: 10.0,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.miscellaneous_services),
              //Image(image: AssetImage('assets/icons/ic_menu_chat_active.png'),height: 20,width: 20,),
              icon: Icon(Icons.miscellaneous_services),
              // Image(image: AssetImage('assets/icons/ic_menu_chat_inactive.png'),height: 20,width: 20,),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              //Image(image: AssetImage('assets/icons/ic_menu_invite_active.png'),height: 20,width: 20,),
              icon: Icon(Icons.home),
              //Image(image: AssetImage('assets/icons/ic_menu_invite_inactive.png'),height: 20,width: 20,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_circle_outlined),
              //Image(image: AssetImage('assets/icons/ic_menu_profile_active.png'),height: 20,width: 20,),
              icon: Icon(Icons.account_circle_outlined),
              //Image(image: AssetImage('assets/icons/ic_menu_profile.png'),height: 20,width: 20,),
              label: 'Profile',
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
