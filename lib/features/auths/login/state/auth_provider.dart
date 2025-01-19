import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthState {
  final bool isAuthenticated;
  final String? token;
  final String? success;
  final String? error;

  AuthState({
    required this.isAuthenticated,
    this.token,
    this.success,
    this.error,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(isAuthenticated: false));

  Future<void> login(
      String login, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse(ApiUrls.postLoginUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'login': login,
        'password': password,
      }),
    );
print(json.decode(response.body));
print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      await SharedPreferencesHelper().saveString('token', data['access_token']);
      await SharedPreferencesHelper()
          .saveString('identifiant', data['candidat']['idcandidat']);
      await SharedPreferencesHelper()
          .saveString('photo', data['candidat']['photo_cand']);
      await SharedPreferencesHelper()
          .saveString('sexe', data['candidat']['sexe_cand']);
      await SharedPreferencesHelper()
          .saveString('nom', data['candidat']['nom_cand']);
      await SharedPreferencesHelper()
          .saveString('prenom', data['candidat']['prenom_cand']);
      await SharedPreferencesHelper()
          .saveString('email', data['candidat']['email_cand']);
      await SharedPreferencesHelper()
          .saveString('phone', data['candidat']['phone_cand']);
      await SharedPreferencesHelper()
          .saveString('habitation', data['candidat']['habitation_cand']);
      await SharedPreferencesHelper()
          .saveString('annee', data['candidat']['experience_an_cand']);
      await SharedPreferencesHelper()
          .saveString('mois', data['candidat']['experience_mois_cand']);
      await SharedPreferencesHelper()
          .saveString('salaire', data['candidat']['salaire_cand']);

      state = AuthState(isAuthenticated: true, token: data['token']);
    } else if (response.statusCode == 303) {
      final shouldReconnect = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Déjà connecté'),
            content: Text(
                'Vous êtes déjà connecté sur un autre appareil. Voulez-vous vous reconnecter ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Non'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Oui'),
              ),
            ],
          );
        },
      );

      if (shouldReconnect == true) {
        // Réessayez la connexion
        final data = json.decode(response.body);
        await retryLogin(data['login'], data['token']);
      }
    } else {
      final data = json.decode(response.body);
      state = AuthState(isAuthenticated: false, error: data['message']);
    }
  }

  Future<void> retryLogin(String login, String token) async {
    final response = await http.post(
      Uri.parse(ApiUrls.postRetryLoginUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'login': login,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      await SharedPreferencesHelper().saveString('token', data['access_token']);
      await SharedPreferencesHelper()
          .saveString('identifiant', data['candidat']['idcandidat']);
      await SharedPreferencesHelper()
          .saveString('photo', data['candidat']['photo_cand']);
      await SharedPreferencesHelper()
          .saveString('sexe', data['candidat']['sexe_cand']);
      await SharedPreferencesHelper()
          .saveString('nom', data['candidat']['nom_cand']);
      await SharedPreferencesHelper()
          .saveString('prenom', data['candidat']['prenom_cand']);
      await SharedPreferencesHelper()
          .saveString('email', data['candidat']['email_cand']);
      await SharedPreferencesHelper()
          .saveString('phone', data['candidat']['phone_cand']);
      await SharedPreferencesHelper()
          .saveString('habitation', data['candidat']['habitation_cand']);
      await SharedPreferencesHelper()
          .saveString('annee', data['candidat']['experience_an_cand']);
      await SharedPreferencesHelper()
          .saveString('mois', data['candidat']['experience_mois_cand']);
      await SharedPreferencesHelper()
          .saveString('salaire', data['candidat']['salaire_cand']);

      state = AuthState(isAuthenticated: true, token: data['token']);
    } else {
      state = AuthState(isAuthenticated: false, error: 'Login failed');
    }
  }

  Future<void> logout() async {
    final token = SharedPreferencesHelper().getString('token');

    final response = await http.post(
      Uri.parse(ApiUrls.postRetryLoginUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      state = AuthState(isAuthenticated: true, success: data['message']);
    } else {
      state = AuthState(isAuthenticated: false, error: 'Login failed');
    }
  }

  Future<void> signUp(
    String photo,
    String sexe,
    String nom,
    String prenom,
    String email,
    String phone,
    String habitation,
    int experience_an,
    int experience_mois,
    int salaire,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse(ApiUrls.postRegisterUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'photo': photo,
        'sexe': sexe,
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'phone': phone,
        'habitation': habitation,
        'experience_an': experience_an,
        'experience_mois': experience_mois,
        'salaire': salaire,
        'password': password,
      }),
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      state = AuthState(isAuthenticated: true, success: data['message']);
    } else {
      state = AuthState(isAuthenticated: false, error: data['message']);
    }
  }
}
