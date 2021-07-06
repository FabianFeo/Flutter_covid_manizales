library flutter_blue_beacon;

import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';


class FlutterBlueBeacon {
  // Singleton
  FlutterBlueBeacon._();

  static FlutterBlueBeacon _instance = new FlutterBlueBeacon._();

  static FlutterBlueBeacon get instance => _instance;

  Stream scan() {
    return FlutterBlue.instance.scanResults;
  }
  
}
