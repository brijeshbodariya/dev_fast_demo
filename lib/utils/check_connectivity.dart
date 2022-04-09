import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    if (kDebugMode) {
      print("internet  available");
    }
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    if (kDebugMode) {
      print("internet  available");
    }
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    // I am connected to a wifi network.
    if (kDebugMode) {
      print("internet not available");
    }
    return false;
  } else {
    if (kDebugMode) {
      print("internet not available");
    }
    return false;
  }
}
