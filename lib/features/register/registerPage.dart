import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:oneloc_use_case/app/colorConstants.dart';
import 'package:oneloc_use_case/app/iconConstants.dart';
import 'package:oneloc_use_case/widgets/customPrivacyPolicyText.dart';
import 'package:oneloc_use_case/widgets/customSizedBox.dart';
import 'package:oneloc_use_case/widgets/customTextFormField.dart';
import 'package:oneloc_use_case/features/register/registerResources.dart';
import 'package:oneloc_use_case/features/register/userRegisterModel.dart';
import 'package:oneloc_use_case/features/register/userRegisterResponseModel.dart';
import 'package:oneloc_use_case/app/paddingConstants.dart';
import 'package:oneloc_use_case/features/register/registerProvider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterResources{

  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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
                height: 30,
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
                height: 30,
              ),
              Form(
                key: _registerKey,
                child: Padding(
                  padding: PaddingConstants().horizontalSmall,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: usernameHintText,
                        textController: usernameController,
                        keyboardType: TextInputType.text,
                      ),
                      CustomSizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: emailHintText,
                        textController: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomSizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CustomSizedBox(
                            width: 120,
                            height: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              child: IntlPhoneField(
                                showDropdownIcon: false,
                                disableLengthCheck: true,
                                showCursor: false,
                                readOnly: true,
                                initialCountryCode: "TR",
                                flagsButtonPadding: PaddingConstants().onlyLeftMedium,
                                flagsButtonMargin: EdgeInsets.zero,
                                dropdownTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.whiteColor),
                              )
                            ),
                          ),
                          CustomSizedBox(
                            width: 10,
                          ),
                          CustomSizedBox(
                            height: 60,
                            width: 242,
                            child: CustomTextFormField(
                              hintText: phoneNumberHintText,
                              textController: phoneNumberController,
                              keyboardType: TextInputType.phone,
                            ),
                          )
                        ],
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
                height: 40,
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
                        registerButtonText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_registerKey.currentState!.validate()) {

                      UserRegisterModel model = UserRegisterModel(
                          userName: usernameController.text,
                          email: emailController.text,
                          phone: phoneNumberController.text,
                          password: passwordController.text
                      );

                      UserRegisterResponseModel response = await context.read<RegisterProvider>().registerUser(model);

                      if (response.message == "User_Registration_Successful") {
                        Navigator.pushNamed(context, '/login');
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Kullanıcı oluşturma işlemi başarısız!"))
                        );
                      }

                    }
                    else {
                      print("olmadı");
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
                        loginButtonText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
              CustomSizedBox(
                height: 53,
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