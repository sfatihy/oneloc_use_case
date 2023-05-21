import 'package:flutter/material.dart';
import 'package:oneloc_use_case/app/iconConstants.dart';
import 'package:oneloc_use_case/features/login/loginProvider.dart';
import 'package:oneloc_use_case/features/login/loginResources.dart';
import 'package:oneloc_use_case/features/login/userLoginModel.dart';
import 'package:oneloc_use_case/widgets/customPrivacyPolicyText.dart';
import 'package:oneloc_use_case/widgets/customSizedBox.dart';
import 'package:oneloc_use_case/app/paddingConstants.dart';
import 'package:oneloc_use_case/widgets/customTextFormField.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginResources {

  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: IconConstants.arrowBackIcon,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(appBarText),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBox(
                height: 70,
              ),
              Padding(
                padding: PaddingConstants().horizontalSmall,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: bodyText1,
                        style: Theme.of(context).textTheme.titleMedium
                      ),
                      TextSpan(
                        text: bodyText2,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold
                        )
                      )
                    ]
                  ),
                ),
              ),
              CustomSizedBox(
                height: 70,
              ),
              Form(
                key: _loginKey,
                child: Padding(
                  padding: PaddingConstants().horizontalSmall,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: emailHintText,
                        textController: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomSizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: passwordHintText,
                        textController: passwordController,
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
              ),
              CustomSizedBox(
                height: 30,
              ),
              Padding(
                padding: PaddingConstants().horizontalSmall,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Şifremi unuttum",style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),),
                    IconConstants.arrowForwardIcon
                  ],
                ),
              ),
              CustomSizedBox(
                height: 30,
              ),
              Padding(
                padding: PaddingConstants().horizontalSmall,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  child: CustomSizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        loginButtonText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_loginKey.currentState!.validate()) {

                      UserLoginModel model = UserLoginModel(
                        email: emailController.text,
                        password: passwordController.text
                      );

                      bool response = await context.read<LoginProvider>().loginUser(model);

                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false,);
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Kullanıcı girişi işlemi başarısız!"))
                        );
                      }

                    }
                    else {
                      throw Exception("Login button validate error!");
                    }
                  },
                ),
              ),
              CustomSizedBox(
                height: 20,
              ),
              Padding(
                padding: PaddingConstants().horizontalSmall,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Theme.of(context).colorScheme.surface,
                  elevation: 0,
                  child: CustomSizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        registerButtonText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                ),
              ),
              CustomSizedBox(
                height: 95,
              ),
              CustomPrivacyPolicyText(),
              CustomSizedBox(
                height: 27,
              )
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
    );
  }
}
