import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreference {

  addStringToSF(String variableName, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(variableName, value);
  }

  addIntToSF(String variableName, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(variableName, value);
  }

  addDoubleToSF(String variableName, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(variableName, value);
  }


  addBoolToSF(String variableName, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(variableName, value);
  }

  getStringValuesSF(String variable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final String? stringValue = prefs.getString(variable);
    return stringValue;
  }

  getBoolValuesSF(String variable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    final bool? boolValue = prefs.getBool(variable);
    return boolValue;
  }

  getIntValuesSF(String variable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    final int? intValue = prefs.getInt(variable);
    return intValue;
  }

  getDoubleValuesSF(String variable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    final double? doubleValue = prefs.getDouble(variable);
    return doubleValue;
  }

  removeValue(String variable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove(variable);
  }

  checkVariable(String variable) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey(variable);
    return checkValue;
  }

  // Future<String> getUserId() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("id") ?? '';
  // }
  //
  // Future<bool> setUserEmail(String email) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setString("email", email);
  // }
  //
  // Future<String> getUserEmail() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("email") ?? '';
  // }
  //
  // Future<bool> setUserType(String userType) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setString("userType", userType);
  // }
  //
  // Future<String> getUserType() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("userType") ?? '';
  // }
  //
  // Future<bool> setName(String name) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setString("name", name);
  // }
  //
  // Future<String> getName() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("name") ?? '';
  // }
  //
  // Future<bool> setLoggedIn(bool status) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setBool("logged_in", status);
  // }
  //
  // Future<bool> getLogedIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool("logged_in") ?? false;
  // }
}