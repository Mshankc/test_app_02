import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/auth_repository.dart';
import 'auth_state.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  String? _currentPhone;

  AuthNotifier(this._repository) : super(const AuthState.initial());

  String? get currentPhone => _currentPhone;

  Future<void> sendOtp(String phone) async {
    state = const AuthState.loading();
    try {
      await _repository.signIn(phone);
      _currentPhone = phone;
      state = AuthState.otpSent(phone: phone);
    } catch (e) {
      state = AuthState.error(
        message: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> verifyOtp(String otp) async {
    if (_currentPhone == null) {
      state = const AuthState.error(message: 'Phone number not found');
      return;
    }

    state = const AuthState.loading();
    try {
      final result = await _repository.verifyOtp(_currentPhone!, otp);
      final token = result['token'] as String? ?? '';
      state = AuthState.authenticated(token: token);
    } catch (e) {
      state = AuthState.error(
        message: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<bool> checkAuthStatus() async {
    return await _repository.isAuthenticated();
  }

  Future<void> logout() async {
    await _repository.logout();
    _currentPhone = null;
    state = const AuthState.initial();
  }

  void resetToInitial() {
    state = const AuthState.initial();
  }
}
