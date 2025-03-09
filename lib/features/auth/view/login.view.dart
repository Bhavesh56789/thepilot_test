import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thepilot_test/features/auth/controller/login.controller.dart';
import 'package:thepilot_test/common/widgets/custom_textfield.widget.dart';
import 'package:thepilot_test/features/home/view/home.view.dart';

class LoginScreen extends ConsumerWidget {
  static const String route = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginControllerProvider);
    final loginController = ref.read(loginControllerProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(color: Color(0xFFEAF2FF)),
              child: Center(
                child: Icon(Icons.image, color: Color(0xFFB4DBFF), size: 32),
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 24),
                  CustomTextField(
                    hintText: "Email Address",
                    onChanged: loginController.updateEmail,
                    keyboardType: TextInputType.emailAddress,
                    errorText: loginState.emailError,
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    hintText: "Password",
                    obscureText: true,
                    onChanged: loginController.updatePassword,
                    errorText: loginState.passwordError,
                  ),

                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF006FFD),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.contains(WidgetState.disabled)) {
                            return Colors.grey;
                          }
                          return const Color(0xFF006FFD);
                        }),
                      ),
                      onPressed:
                          loginState.isValid
                              ? () => context.go(HomeScreen.route)
                              : null,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: "Not a member? ",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8F9098),
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "Register now",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF006FFD),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Divider(color: Color(0xFFD4D6DD), thickness: 0.5),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "App made by",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF71727A),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF006FFD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Bhavesh Bellaney",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
