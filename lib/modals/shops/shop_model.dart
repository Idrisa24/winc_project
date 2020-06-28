import 'package:google_maps_flutter/google_maps_flutter.dart';

class Shop {
  int id;
  String shopName;
  String shopAddress;
  String shopDescription;
  String shopThumb;
  LatLng shopLocationCoord;

  Shop(
      {this.shopName,
      this.shopAddress,
      this.shopDescription,
      this.shopThumb,
      this.shopLocationCoord});
}

final List<Shop> listShops = [
  Shop(
      shopName: 'Mwembeladu Pharmacy',
      shopThumb:
          'https://lh5.googleusercontent.com/p/AF1QipMTgLFNUbZRveRcsTZV-ahupNxegF216bfvEU_I=w408-h544-k-no',
      shopLocationCoord: LatLng(-6.1626697, 39.1984398),
      shopDescription:
          'Historic area with narrow alleys, the ornate Old Dispensary building & Darajani Market spice stalls.'),
  Shop(
      shopName: 'ZanRaha tours & travel',
      shopThumb:
          'https://lh5.googleusercontent.com/p/AF1QipMgIck8r92IPPvI0EFMpBpirqzOkD797X6Qp55m=w408-h306-k-no',
      shopLocationCoord: LatLng(-6.1619135, 39.1935398),
      shopDescription:
          'Historic area with narrow alleys, the ornate Old Dispensary building & Darajani Market spice stalls.'),
  Shop(
      shopName: 'MwanaKwerekwe Market',
      shopThumb:
          'https://lh5.googleusercontent.com/p/AF1QipOLm343rk4p1037snbfF9Ff8NBAEccpjqnViLkv=w426-h240-k-no',
      shopLocationCoord: LatLng(-6.1750362, 39.226345),
      shopDescription:
          'Historic area with narrow alleys, the ornate Old Dispensary building & Darajani Market spice stalls.'),
  Shop(
      shopName: 'Stone Town',
      shopThumb:
          'https://lh5.googleusercontent.com/p/AF1QipMgIck8r92IPPvI0EFMpBpirqzOkD797X6Qp55m=w408-h306-k-no',
      shopLocationCoord: LatLng(-6.1625278, 39.1842598),
      shopDescription:
          'Historic area with narrow alleys, the ornate Old Dispensary building & Darajani Market spice stalls.'),
  Shop(
      shopName: 'Zanzibar Palace Hotel',
      shopThumb:
          'https://lh5.googleusercontent.com/p/AF1QipNu-7RjKZjuhO_mcApuPmndenj20gbsZ76Y1aJc=w408-h271-k-no',
      shopLocationCoord: LatLng(-6.1619135, 39.1935398),
      shopDescription:
          'Historic area with narrow alleys, the ornate Old Dispensary building & Darajani Market spice stalls.'),
  Shop(
      shopName: 'Zanzibar Coffee House',
      shopThumb:
          'https://lh5.googleusercontent.com/p/AF1QipNSX-c5o7_EgqdOP2ET-sRrQdl7-rRc3CK0HIKi=w408-h306-k-no',
      shopLocationCoord: LatLng(-6.1616686, 39.1933269),
      shopDescription:
          'Historic area with narrow alleys, the ornate Old Dispensary building & Darajani Market spice stalls.'),
];
