import 'package:beacon_broadcast/beacon_broadcast.dart';
import 'package:uuid/uuid.dart';

class BeaconBroadcastSrvice {
  var uuid = Uuid();
  BeaconBroadcast beaconBroadcaste = BeaconBroadcast();
  Future<void> beaconBroadcast() async {
    BeaconStatus transmissionSupportStatus =
        await beaconBroadcaste.checkTransmissionSupported();
    beaconBroadcaste
        .setUUID(uuid.v4())
        .setMajorId(1)
        .setMinorId(100)
        //optional
        .setIdentifier('com.example.myDeviceRegion') //iOS-only, optional
        .setLayout('m:2-3=0215,i:4-19,i:20-21,i:22-23,p:24-24')
        .setManufacturerId(0x004C)
        .start();
  }
}
