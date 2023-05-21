import 'package:flutter/material.dart';
import 'package:oneloc_use_case/app/colorConstants.dart';
import 'package:oneloc_use_case/features/splash/splashProvider.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.hintText,
    this.keyboardType,
    this.isPassword
  });

  final TextEditingController textController;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  int touched = 0;

  @override
  Widget build(BuildContext context) {

    setColor (int data) {
      if(data == 0) {
        return context.watch<SplashProvider>().getThemeBoolean ? ColorConstants.greyColorAccent : ColorConstants.greyColor2;
      }
      else if (data == 1) {
        return context.watch<SplashProvider>().getThemeBoolean ? ColorConstants.greyColorAccent2 : ColorConstants.greyColor;
      }
      else {
        return Colors.transparent;
      }
    }

    setBorder(int data) {
      if(data == 0) {
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        );
      }
      else if (data == 1) {
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        );
      }
      else {
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: context.watch<SplashProvider>().getThemeBoolean ? ColorConstants.greyColorAccent :ColorConstants.greyColor2,
            width: 3
          ),
        );
      }
    }

    return TextFormField(
      controller: widget.textController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: setColor(touched),
        enabledBorder: setBorder(touched)
      ),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: widget.isPassword ?? false,
      onTap: () {
        setState(() {
          touched = 1;
        });
      },
      onEditingComplete: () {
        setState(() {
          touched = 2;
        });
      },
      validator: (data) {

        data = data!.trim();

        print(data.isEmpty);

        print(widget.hintText);

        if (widget.hintText == "E-posta adresi") {
          return validatorEmail(data);
        }
        else if (widget.hintText == "Şifre") {
          return validatorPassword(data);
        }
        else if (widget.hintText == "Telefon numarası") {
          return validatorPhoneNumber(data);
        }
        else {
          return validateNormal(data);
        }

      },
    );
  }
}


validatorEmail(String data) {
  if (data.isEmpty || !data.contains("@")) {
    return "Geçersiz e posta adresi";
  }
  else {
    return null;
  }
}

validatorPassword(String data) {
  if (data.isEmpty || data.length < 6) {
    return "Geçersiz parola min 6 karakterli olmalı";
  }
  else {
    return null;
  }
}

validatorPhoneNumber(String data) {
  if (data.isEmpty || data.length != 10) {
    return "Geçersiz telefon numarası";
  }
  else {
    return null;
  }
}

validateNormal(String data) {
  if (data.isEmpty) {
    return "Geçersiz değer";
  }
  else {
    return null;
  }
}