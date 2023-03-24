// ignore_for_file: use_build_context_synchronously
import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/auth_page/login_page.dart';
import 'package:darts_link_project/views/auth_page/store_register_application_review_page.dart';
import 'package:darts_link_project/views/top_page/top_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          Center(
            child: Image.asset('assets/images/Frame.png'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _checkAuth();
    super.initState();
  }

  Future<void> _checkAuth() async {
    //  await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 2));
    final user = AuthRepository.currentFirebaseUser;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const LoginPage()),
        ),
      );
      return;
    }

    final appUser = await AppUserRepository.fetchAppUser(user.uid);
    AuthRepository.currentUser = appUser;
    if (appUser is StoreOwner && !appUser.isApproved) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const StoreRegisterApplicationReviewPage()),
        ),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => const TopPage()),
      ),
    );
  }
}
