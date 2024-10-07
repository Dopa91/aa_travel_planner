import 'dart:developer';

class SettingsRepository {
  bool _darkMode = false;
  String _fontSize = 'Medium';
  String _language = 'English';
  bool _privacyMode = true;
  String _distanceUnit = 'Kilometers';

  bool getDarkMode() => _darkMode;
  String getFontSize() => _fontSize;
  String getLanguage() => _language;
  bool getPrivacyMode() => _privacyMode;
  String getDistanceUnit() => _distanceUnit;

  void setDarkMode(bool value) {
    _darkMode = value;
    log('Dark Mode set to: $_darkMode');
  }

  void setFontSize(String value) {
    _fontSize = value;
    log('Font Size set to: $_fontSize');
  }

  void setLanguage(String value) {
    _language = value;
    log('Language set to: $_language');
  }

  void setPrivacyMode(bool value) {
    _privacyMode = value;
    log('Privacy Mode set to: $_privacyMode');
  }

  void setDistanceUnit(String value) {
    _distanceUnit = value;
    log('Distance Unit set to: $_distanceUnit');
  }
}
