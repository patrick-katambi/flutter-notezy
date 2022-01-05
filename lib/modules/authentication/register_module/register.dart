import 'package:flutter/material.dart';
import 'package:global_news/modules/authentication/login_module/component/login_message.dart';
import 'package:global_news/modules/authentication/register_module/components/register_form.dart';
import 'package:global_news/modules/authentication/register_module/components/register_message.dart';
import 'package:global_news/modules/authentication/register_module/widgets/register_button.dart';
import 'package:global_news/modules/authentication/widgets/back_icon_button.dart';
import 'package:global_news/modules/authentication/widgets/login_or_register.dart';
import 'package:global_news/modules/routes.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.landscape
          ? Stack(
              children: [
                ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                  ),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 50.0),
                    const LoginMessage(),
                    const SizedBox(height: 20.0),
                    RegisterForm(registerFormKey: _registerFormKey),
                    const SizedBox(height: 20.0),
                    RegisterButton(registerFormKey: _registerFormKey),
                    const SizedBox(height: 20.0),
                  ],
                ),
                const Positioned(
                  top: 50.0,
                  left: 10.0,
                  child: BackIconButton(),
                )
              ],
            )
          : Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const SizedBox(height: 50.0),
                            Row(children: const [BackIconButton(), Spacer()]),
                            const SizedBox(height: 40.0),
                            const RegisterMessage(),
                            const SizedBox(height: 40.0),
                            RegisterForm(registerFormKey: _registerFormKey),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom:
                      // top expanded widget = 5x
                      // bottom expanded widget = 1x
                      // thus top expanded is 5 times more then bottom expanded widget
                      // size of bottom expanded widget is 1/6 of full screen height
                      // then subtracting by half of button padding and button height combined
                      // halving the result offsets towards the top by 15.0
                      // subtracting by 15.0 centers the button on the bottom expanded widget
                      (MediaQuery.of(context).size.height * (1 / 6) - 25.0) /
                              2 -
                          25.0,
                  child: Column(
                    children: [
                      const AlreadyRegistered(),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child:
                            RegisterButton(registerFormKey: _registerFormKey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class AlreadyRegistered extends StatelessWidget {
  const AlreadyRegistered({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginOrRegister(
      route: loginRoute,
      message: 'Already have an account?  ',
      routePlaceHolder: 'Login',
    );
  }
}
