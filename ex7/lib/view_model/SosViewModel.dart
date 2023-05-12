import 'package:flutter/cupertino.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:location/location.dart';

class SosViewModel extends ChangeNotifier{
  var _message = "Help me!";
  List<String> phones = ["+32492877015"];

  String get getMessage => _message;

  void updateMessage(String message){
    _message = message;
    notifyListeners();
  }

  void addPhone(String phone){
    phones.add(phone);
    notifyListeners();
  }

  void removePhone(String phone){
    phones.remove(phone);
    notifyListeners();
  }

  Future<void> sendSOS() async {
    var location = await _getLocation();
    await sendSMS(
      message: _message.replaceFirst("@loc", "${location?.latitude}, ${location?.longitude}"),
      recipients: [...phones],
    );
  }

  Future<LocationData?> _getLocation() async {
    Location location = Location();

    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }
}