import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class ContactService {
  static Future<PhoneContact?> selectContact() async {
    final bool granted = await FlutterContactPicker.hasPermission();
    if(!granted){
      final requestGranded = await FlutterContactPicker.requestPermission();
      if(!requestGranded){
        return null;
      }
    }
    return await FlutterContactPicker.pickPhoneContact();
  }
}