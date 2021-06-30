import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final auth = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final resp = await _googleSignIn.signIn();
      final user = UserModel(name: resp!.displayName!, photoURL: resp.photoUrl!);
      auth.setUser(context, user);
      print(resp);
    } catch (e) {
      print(e);
    }
  }
}
