import 'package:auto_route/annotations.dart';
import 'package:base_setup/data/viewmodels/trader.login.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage(name: 'traderLoginScreen')
class TraderLoginScreen extends StatelessWidget {
  const TraderLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TraderLoginViewModel.buildWithProvider(
      builder: (_, __) {
        return const _TraderLoginScreen();
      },
    );
  }
}

class _TraderLoginScreen extends StatelessWidget {
  const _TraderLoginScreen();

  @override
  Widget build(BuildContext context) {
    TraderLoginViewModel model = Provider.of<TraderLoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Red Trade',
          style:
              TextStyle(color: Color(0xff101F5A), fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                model.logout(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    color: Color(0xff3DDC84),
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
                    color: Color(0xff3DDC84),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: model.serverTextEditingController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: 'Server Name',
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
                    Icons.web_outlined,
                    color: Color(0xff3DDC84),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio<String>(
                          activeColor: Theme.of(context).primaryColor,
                          value: model.traderTypes[0],
                          groupValue: model.selectedTrader,
                          onChanged: (value) {
                            model.updateRadio(value);
                          },
                        ),
                        Text(model.traderTypes[0])
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio<String>(
                          activeColor: Theme.of(context).primaryColor,
                          value: model.traderTypes[1],
                          groupValue: model.selectedTrader,
                          onChanged: (value) {
                            model.updateRadio(value);
                          },
                        ),
                        Text(model.traderTypes[1])
                      ],
                    ),
                  ),
                ],
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
                              color: const Color(0xff3DDC84),
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
      ),
    );
  }
}
