import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto/auth_service.dart';
import 'package:projeto/login_controller.dart';

// Criação de um mock da classe AuthService
class MockAuthService extends Mock implements AuthService {}

void main() {
  group('LoginController Testes', () {
    late LoginController loginController;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      loginController = LoginController(mockAuthService);
    });

    test('Login com sucesso', () async {
      // Configura o mock para retornar true para uma autenticação bem-sucedida
      when(mockAuthService.login('user@example.com', 'password'))
          .thenAnswer((_) async => true);

      // Faz a chamada para a função de login
      await loginController.login('user@example.com', 'password');

      // Verifica se as variáveis isLoading e isLoggedIn foram atualizadas corretamente
      expect(loginController.isLoading.value, false);
      expect(loginController.isLoggedIn.value, true);
    });

    test('Login com falha', () async {
      // Configura o mock para retornar false para uma autenticação falha
      when(mockAuthService.login('user@example.com', 'password'))
          .thenAnswer((_) async => false);

      // Faz a chamada para a função de login
      await loginController.login('user@example.com', 'password');

      // Verifica se as variáveis isLoading e isLoggedIn foram atualizadas corretamente
      expect(loginController.isLoading.value, false);
      expect(loginController.isLoggedIn.value, false);
    });

    test('Login com atraso', () async {
      // Configura o mock para retornar true para uma autenticação bem-sucedida após um atraso
      when(mockAuthService.login('user@example.com', 'password'))
          .thenAnswer((_) async => Future.delayed(Duration(seconds: 2), () => true));

      // Faz a chamada para a função de login
      final loginFuture = loginController.login('user@example.com', 'password');

      // Verifica se isLoading é verdadeiro enquanto a autenticação está em andamento
      expect(loginController.isLoading.value, true);

      // Aguarda a conclusão da autenticação
      await loginFuture;

      // Verifica se isLoading é falso após a conclusão da autenticação
      expect(loginController.isLoading.value, false);
    });
  });
}
