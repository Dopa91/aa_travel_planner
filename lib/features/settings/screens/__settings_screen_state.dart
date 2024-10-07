import 'package:aa_travel_planner/features/settings/repositories/settings_repository.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsRepository settingsRepository = SettingsRepository();

  @override
  Widget build(BuildContext context) {
    bool darkMode = settingsRepository.getDarkMode();
    String fontSize = settingsRepository.getFontSize();
    String language = settingsRepository.getLanguage();
    bool privacyMode = settingsRepository.getPrivacyMode();
    String distanceUnit = settingsRepository.getDistanceUnit();

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Settings',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Enable dark theme for the app'),
                value: darkMode,
                onChanged: (bool value) {
                  setState(() {
                    settingsRepository.setDarkMode(value);
                  });
                },
                activeColor: Colors.teal,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Font Size'),
                subtitle: const Text('Adjust the font size in the app'),
                trailing: DropdownButton<String>(
                  value: fontSize,
                  items:
                      <String>['Small', 'Medium', 'Large'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      settingsRepository.setFontSize(newValue!);
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Language'),
                subtitle: const Text('Choose app language'),
                trailing: DropdownButton<String>(
                  value: language,
                  items: <String>['English', 'Spanish', 'French', 'German']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      settingsRepository.setLanguage(newValue!);
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Privacy Mode'),
                subtitle: const Text('Hide sensitive trip details'),
                value: privacyMode,
                onChanged: (bool value) {
                  setState(() {
                    settingsRepository.setPrivacyMode(value);
                  });
                },
                activeColor: Colors.teal,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Distance Unit'),
                subtitle: const Text('Choose between kilometers or miles'),
                trailing: DropdownButton<String>(
                  value: distanceUnit,
                  items: <String>['Kilometers', 'Miles'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      settingsRepository.setDistanceUnit(newValue!);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
