import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oneloc_use_case/app/paddingConstants.dart';

class CustomPrivacyPolicyText extends StatelessWidget {
  CustomPrivacyPolicyText({Key? key}) : super(key: key);

  String privacyPolicyText1 = "Oneloc’un mobil uygulamasına giriş yapan kullanıcılar ";
  String privacyPolicyText2 = "Gizlilik Politikası";
  String privacyPolicyText3 = "’na ve ";
  String privacyPolicyText4 = "Şartlar ve Koşullar";
  String privacyPolicyText5 = "’a tabidir.";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants().horizontalLarge,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: privacyPolicyText1,
              style: Theme.of(context).textTheme.bodySmall
            ),
            TextSpan(
              text: privacyPolicyText2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              )
            ),
            TextSpan(
              text: privacyPolicyText3,
              style: Theme.of(context).textTheme.bodySmall
            ),
            TextSpan(
              text: privacyPolicyText4,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              )
            ),
            TextSpan(
              text: privacyPolicyText5,
              style: Theme.of(context).textTheme.bodySmall
            )
          ]
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
