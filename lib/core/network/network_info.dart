import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<List<ConnectivityResult>> get connectivityResult;

  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  NetworkInfo(this.connectivity) {
    connectivity = this.connectivity;
  }

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
    final List<ConnectivityResult> result = await connectivity.checkConnectivity();
    if (result.contains( ConnectivityResult.none)) {
      return true;
    }
    return false;
  }

  // to check type of internet connectivity
  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
    return await connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
