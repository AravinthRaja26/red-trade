import 'package:auto_route/annotations.dart';
import 'package:base_setup/data/viewmodels/login.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage(name: 'loginScreen')
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginViewModel.buildWithProvider(
      builder: (_, __) {
        return const _LoginScreen();
      },
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();

  @override
  Widget build(BuildContext context) {
    LoginViewModel model = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 36.0),
              child: Center(
                child: Text(
                  'Red Trade',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff00AEEF)),
                ),
              ),
            ),
            TextFormField(
              controller: model.emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff101F5A)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff101F5A)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff101F5A)),
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Color(0xff00AEEF),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              obscureText: true,
              controller: model.passwordTextEditingController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff101F5A)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff101F5A)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff101F5A)),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Color(0xff00AEEF),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: model.busy
                  ? const Center(child: CircularProgressIndicator())
                  : InkWell(
                      onTap: () {
                        if (!model.busy) model.login(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff00AEEF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 46),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
