// app_test.dart
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Teste de Integração', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver!.close();
      }
    });

    test('Navegação entre tela de login e tela principal', () async {
      // Verifica se a tela de login é exibida inicialmente
      expect(await driver!.getText(find.text('Tela de Login')), 'Tela de Login');

      // Clica no botão "Login" na tela de login
      await driver!.tap(find.text('Login'));

      // Aguarda um pequeno intervalo para a transição entre telas
      await driver!.waitFor(find.text('Bem-vindo à Tela Principal!'));

      // Verifica se a tela principal foi carregada após o login
      expect(await driver!.getText(find.text('Tela Principal')), 'Tela Principal');
    });
  });
}
