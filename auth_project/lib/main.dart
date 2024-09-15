import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Авторизация',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginMode = true;
  bool _rememberMe = false;
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _toggleAuthMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
    });
  }

  void _submit() {
    if (_isLoginMode) {
      print('Логин: ${_loginController.text}');
      print('Пароль: ${_passwordController.text}');
    } else {
      print('Регистрация: ${_loginController.text}');
      print('Пароль: ${_passwordController.text}');
      print('Подтверждение пароля: ${_confirmPasswordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Text(
              'Авторизация',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 120,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Логин',
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Пароль',
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            if (!_isLoginMode)
              Column(
                children: [
                  SizedBox(height: 16),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Подтвердите пароль',
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text(
                  'Запомнить меня',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 48),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              child: Text(
                _isLoginMode ? 'Войти' : 'Зарегистрироваться',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleAuthMode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.blue),
                ),
                minimumSize: Size(double.infinity, 48),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              child: Text(
                _isLoginMode
                    ? 'Регистрация'
                    : 'Уже есть аккаунт? Войти',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            if (_isLoginMode)
              TextButton(
                onPressed: () {
                  print('Восстановить пароль');
                },
                child: Text(
                  'Восстановить пароль',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

