import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String _id = 'idUser';

  // For saving user id
  static void saveId(String id) {
    print('id: $id');
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_id, id);
    });
  }

  //For getting user id
  static Future getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString(_id) ?? '';
    return id;
  }

  // For removing user id
  static void removeId() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(_id);
    });
  }
}
