import 'package:actdata/flutter_flow/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _userAuthToken = prefs.getString('ff_user_auth_token') ?? _userAuthToken;
    _refreshToken = prefs.getString('ff_refresh_token') ?? _refreshToken;
    _user = await getUserData(prefs);
  }

  Future<User> getUserData(SharedPreferences prefs) async {
    return User(
      id: prefs.getString('ff_id') ?? _user.id,
    );
  }

  Future clearDataUser() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  User _user = User(
    id: "",
  );

  User get user {
    return _user;
  }

  set user(User value) {
    _user = value;
    prefs.setString("ff_id", value.id);
  }

  late SharedPreferences prefs;

  String _userAuthToken = "";

  String get userAuthToken {
    return _userAuthToken;
  }

  set userAuthToken(String value) {
    _userAuthToken = value;
    prefs.setString("ff_user_auth_token", value);
  }

  String _refreshToken = "";

  String get refreshToken {
    return _refreshToken;
  }

  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString("ff_refresh_token", value);
  }

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
}
