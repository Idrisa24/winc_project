import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:winc_project/screens/business/business_screen.dart';
import 'package:winc_project/screens/google/google_map_screen.dart';
import 'package:winc_project/screens/products/products_list_screen.dart';
import 'package:winc_project/screens/profile/profile_screen.dart';
import 'package:winc_project/screens/settings/user_settings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  // The list of all home pages
  final UserProfile _userProfile = new UserProfile();
  final UserSettings _userSettings = new UserSettings();
  final ProductScreen _productScreen = new ProductScreen();
  final BusinessScreen _businessScreen = new BusinessScreen();
  final BusinessLocations _businessLocations = new BusinessLocations();

  Widget _pageShown = new UserProfile();

  Widget _changePage(int page) {
    switch (page) {
      case 0:
        return _productScreen;
        break;
      case 1:
        return _userProfile;
        break;
      case 2:
        return _businessLocations;
        break;
      case 3:
        return _businessScreen;
        break;
      case 4:
        return _userSettings;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   actions: <Widget>[
      //     IconButton(
      //       color: Colors.white,
      //       onPressed: () {},
      //       icon: Icon(Icons.more_vert),
      //     ),
      //   ],
      // ),
      // drawer: Drawer(
      //   child: Container(
      //     child: ListView(),
      //     color: Colors.teal[800],
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _pageIndex,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.list, size: 30, color: Color(0xFF00695c)),
          Icon(Icons.perm_identity, size: 30, color: Color(0xFF00695c)),
          Icon(Icons.location_on, size: 30, color: Color(0xFF00695c)),
          Icon(Icons.card_travel, size: 30, color: Color(0xFF00695c)),
          Icon(Icons.vpn_key, size: 30, color: Color(0xFF00695c)),
        ],
        // color: Color(0xFF00695c),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        // buttonBackgroundColor: Color(0xFF00695c),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int tapIndex) {
          setState(() {
            _pageShown = _changePage(tapIndex);
          });
        },
      ),
      body: Container(
        color: Color(0xFF00695c),
        child: Center(
          child: _pageShown,
        ),
      ),
    );
  }
}
