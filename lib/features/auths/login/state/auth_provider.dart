import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/constants/constants.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthState {
  final bool isAuthenticated;
  final String? token;
  final String? error;

  AuthState({
    required this.isAuthenticated,
    this.token,
    this.error,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(isAuthenticated: false));

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiUrls.postLoginUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      state = AuthState(isAuthenticated: true, token: data['token']);
    } else {
      state = AuthState(isAuthenticated: false, error: 'Login failed');
    }
  }

  Future<void> signUp(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiUrls.postRegisterUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      state = AuthState(isAuthenticated: true, token: data['token']);
    } else {
      state = AuthState(isAuthenticated: false, error: 'Signup failed');
    }
  }
}
