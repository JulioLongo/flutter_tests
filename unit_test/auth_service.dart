// auth_service.dart
class AuthService {
  Future<bool> login(String email, String password) async {
    // Simula uma chamada de autenticação ao servidor
    await Future.delayed(Duration(seconds: 1));
    return email == 'user@example.com' && password == 'password';
  }
}
