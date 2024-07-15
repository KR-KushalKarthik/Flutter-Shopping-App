import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _lightTheme = ThemeData.light();
  ThemeData _darkTheme = ThemeData.dark();

  ThemeMode _themeMode = ThemeMode.light;

  ThemeData get currentTheme =>
      _themeMode == ThemeMode.light ? _lightTheme : _darkTheme;
  ThemeMode get currentThemeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';
  bool _notificationEnabled = true;
  String _email = 'example@email.com';
  String _username = 'username';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = _darkModeEnabled ? ThemeData.dark() : ThemeData.light();

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Theme',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
                items: <String>[
                  'English',
                  'Spanish',
                  'French',
                  'German',
                  'Telugu',
                  'Tamil',
                  'Hindi',
                  'Japanese',
                  'Russian',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SwitchListTile(
                title: Text('Enable Notifications'),
                value: _notificationEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationEnabled = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text(_email),
                onTap: _editEmail,
              ),
              ListTile(
                title: Text('Username'),
                subtitle: Text(_username),
                onTap: _editUsername,
              ),
              ListTile(
                title: Text('Change Password'),
                onTap: _changePassword,
              ),
              ListTile(
                title: Text('Profile Picture'),
                onTap: _changeProfilePicture,
              ),
              ListTile(
                title: Text('Delete Account'),
                onTap: _deleteAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to edit email
  void _editEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newEmail = _email;
        return AlertDialog(
          title: Text('Edit Email'),
          content: TextField(
            onChanged: (value) {
              newEmail = value;
            },
            decoration: InputDecoration(labelText: 'New Email'),
          ),
          backgroundColor: Colors.white, // Set the background color here
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _email = newEmail;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Method to edit username
  void _editUsername() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newUsername = _username;
        return AlertDialog(
          title: Text('Edit Username'),
          content: TextField(
            onChanged: (value) {
              newUsername = value;
            },
            decoration: InputDecoration(
              labelText: 'New Username',
              // Set the color for the text field here
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.white, // Set the background color here
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _username = newUsername;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Method to change password
  void _changePassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newPassword = '';
        String confirmPassword = '';
        return AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newPassword = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  // Set the color for the text field here
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              TextField(
                onChanged: (value) {
                  confirmPassword = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  // Set the color for the text field here
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white, // Set the background color here
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (newPassword.isEmpty || confirmPassword.isEmpty) {
                  // Show an error message if passwords are empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter both passwords.'),
                    ),
                  );
                  return;
                }
                if (newPassword != confirmPassword) {
                  // Show an error message if passwords do not match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Passwords do not match.'),
                    ),
                  );
                  return;
                }
                print('New Password: $newPassword');
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _changeProfilePicture() {
    // Implement logic to change profile picture
  }

  // Method to delete account
  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account?'),
          backgroundColor: Colors.white, // Set the background color here
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
