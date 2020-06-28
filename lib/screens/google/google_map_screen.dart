import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:winc_project/modals/shops/shop_model.dart';

class BusinessLocations extends StatefulWidget {
  BusinessLocations({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BusinessLocationsState createState() => _BusinessLocationsState();
}

class _BusinessLocationsState extends State<BusinessLocations> {
  Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Marker> markerList = [];
  List<double> serachAddress = [];

  PageController _pageController;
  Geolocator _geolocator;
  // Position _position;

  int _prevPage;

  String address;

  @override
  void initState() {
    super.initState();

    _geolocator = Geolocator();

    checkPermission();
    // updateLocation();
    // LocationOptions locationOptions =
    //     LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    listShops.forEach((element) {
      markerList.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          infoWindow: InfoWindow(title: element.shopName),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: element.shopLocationCoord));
    });

    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_pageScroll);

    // StreamSubscription positionStream = _geolocator
    //     .getPositionStream(locationOptions)
    //     .listen((Position position) {
    //   _position = position;
    // });
  }

  void _pageScroll() {
    if (_pageController.page.toInt() != _prevPage) {
      _prevPage = _pageController.page.toInt();
      _moveCamera();
    }
  }

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
    });
    _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    _geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }

  _shopsList(index) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }

        return Center(
            child: SizedBox(
                height: Curves.easeInOut.transform(value) * 325.0,
                width: Curves.easeInOut.transform(value) * 380.0,
                child: widget));
      },
      child: InkWell(
        onTap: () => this
            ._scaffoldKey
            .currentState
            .showBottomSheet((context) => _buildBottomSheet(context)),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 110.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0)),
                            image: DecorationImage(
                                image: NetworkImage(listShops[index].shopThumb),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              listShops[index].shopName,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Text(
                            //   listShops[index].shopAddress,
                            //   style: TextStyle(
                            //     fontSize: 12.5,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                            Container(
                              width: size.width * 0.40,
                              child: Text(
                                listShops[index].shopDescription,
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void updateLocation() async {
  //   try {
  //     Position newPosition = await Geolocator()
  //         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //         .timeout(new Duration(seconds: 5));

  //     setState(() {
  //       _position = newPosition;
  //     });
  //   } catch (e) {
  //     print('Error: ${e.toString()}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () {
      //         showSearch(context: context, delegate: ShopSearch());
      //       },
      //     )
      //   ],
      // ), Drawer(),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
          _buildContainer(context),
          _searchBar(context),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 20.0,
      child: Container(
        height: size.height * 0.25,
        width: size.width,
        child: PageView.builder(
          controller: _pageController,
          itemCount: listShops.length,
          itemBuilder: (BuildContext context, int index) {
            return _shopsList(index);
          },
        ),
      ),
    );
  }

  searchdata(String address) async {
    if (address != null) {
      List<Placemark> placemark =
          await Geolocator().placemarkFromAddress(address);
      // LatLng locate = LatLng();
      // GoogleMapController controller = await _controller.future;
      // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      //   target: LatLng(
      //       placemark[0].position.latitude, placemark[0].position.longitude),
      //   zoom: 18.0,
      //   bearing: 45.0,
      //   tilt: 60.0,
      // )));
      double latitude = placemark[0].position.latitude.toDouble();
      double logitude = placemark[0].position.longitude.toDouble();
      serachAddress.add(latitude);
      serachAddress.add(logitude);

      _moveCamera(latLong: serachAddress);

      print(placemark[0].country);
      print(placemark[0].position);
      print(placemark[0].locality);
      print(placemark[0].administrativeArea);
      print(placemark[0].postalCode);
      print(placemark[0].name);
      print(placemark[0].isoCountryCode);
      print(placemark[0].subLocality);
      print(placemark[0].subThoroughfare);
      print(placemark[0].thoroughfare);
    }
  }

  Widget _googleMap(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition:
            CameraPosition(target: LatLng(-6.1625278, 39.1842598), zoom: 10),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(markerList),
      ),
    );
  }

  Future<void> _moveCamera({List<double> latLong}) async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: latLong != null
          ? LatLng(latLong[0], latLong[1])
          : listShops[_pageController.page.toInt()].shopLocationCoord,
      zoom: 18.0,
      bearing: 45.0,
      tilt: 60.0,
    )));
  }

  Widget _searchBar(BuildContext context) {
    return Positioned(
      top: 50.0,
      right: 15.0,
      left: 15.0,

      child: Container(
        alignment: Alignment.topRight,
        child: FloatingActionButton(
          elevation: 0.0,
          child: Icon(Icons.search, color: Color(0xFF00695c)),
          backgroundColor: Colors.transparent,
          mini: true,
          onPressed: () => showSearch(context: context, delegate: ShopSearch()),
        ),
      ),
      // child: Container(
      //   height: 50.0,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      //   child: TextField(
      //     showCursor: true,
      //     readOnly: true,
      //     onTap: () {
      //       showSearch(context: context, delegate: ShopSearch());
      //     },
      //     onChanged: (val) {
      //       setState(() {
      //         address = val;
      //       });
      //     },
      //     decoration: InputDecoration(
      //       hintText: 'Search Cities or Bussiness name',
      //       border: InputBorder.none,
      //       contentPadding: EdgeInsets.only(
      //         left: 15.0,
      //         top: 15.0,
      //         bottom: 15.0,
      //       ),
      //       suffixIcon: IconButton(
      //         icon: Icon(Icons.search),
      //         onPressed: () {
      //           searchdata(address);
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  _buildBottomSheet(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.80,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        children: <Widget>[
          ListTile(
              title: Text(listShops[_pageController.page.toInt()].shopName)),
        ],
      ),
    );
  }
}

class ShopSearch extends SearchDelegate<Shop> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: listShops.length,
        itemBuilder: (context, index) {
          final Shop shop = listShops[index];
          return ListTile(
            title: Text(shop.shopName),
          );
        });
  }
}
