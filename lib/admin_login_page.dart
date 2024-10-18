import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  void _adminLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Hier zou je een echte verificatie moeten implementeren
    // Voor nu, laten we gewoon een voorbeeldcontrole doen
    if (username == 'admin' && password == 'admin123') {
      // Als het inloggen succesvol is, hier kun je navigeren naar de admin homepagina
      _showSuccessDialog();
    } else {
      setState(() {
        _errorMessage = 'Onjuiste gebruikersnaam of wachtwoord';
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Admin Login Successful'),
          content: const Text('You have logged in as an admin!'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(); // Sluit de dialoog
                // Hier kun je navigeren naar de admin homepagina
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) => const AdminHomePage()),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: _errorMessage,
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _errorMessage,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adminLogin,
              child: const Text('Login as Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
