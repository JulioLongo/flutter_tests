import 'package:get/get.dart';
import 'package:projeto/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService;

  LoginController(this._authService);

  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    isLoggedIn.value = await _authService.login(email, password);
    isLoading.value = false;
  }
}
