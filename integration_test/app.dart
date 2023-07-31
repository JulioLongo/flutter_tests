// app.dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Teste de Integração',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Principal')),
      body: Center(
        child: Text('Bem-vindo à Tela Principal!'),
      ),
    );
  }
}
