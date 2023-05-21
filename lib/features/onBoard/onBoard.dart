import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oneloc_use_case/app/colorConstants.dart';
import 'package:oneloc_use_case/app/imageConstants.dart';
import 'package:oneloc_use_case/features/onBoard/onBoardResources.dart';
import 'package:oneloc_use_case/features/splash/splashProvider.dart';
import 'package:oneloc_use_case/widgets/customPrivacyPolicyText.dart';
import 'package:oneloc_use_case/widgets/customSizedBox.dart';
import 'package:oneloc_use_case/app/paddingConstants.dart';
import 'package:oneloc_use_case/widgets/customSwitchTheme.dart';
import 'package:provider/provider.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> with OnBoardResources {

  //TODO: background daki alttaki şekiller var.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            ImageConstants.background,
            fit: BoxFit.fill,
          ),
          // buraya tema için switch ekledim ikiside çalışsın diye.
          Align(
            alignment: const Alignment(1,-0.9),
            child: CustomSwitchTheme(context)
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBox(
                  height: 114,
                ),
                Padding(
                  padding: PaddingConstants().onlyLeftMedium,
                  child: SvgPicture.asset(ImageConstants.onelocbusiness_logo),
                ),
                CustomSizedBox(
                  height: 71,
                ),
                Padding(
                  padding: PaddingConstants().horizontalMedium,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: bodyText1,
                          style: Theme.of(context).textTheme.titleLarge
                        ),
                        TextSpan(
                          text: bodyText2,
                          style: Theme.of(context).textTheme.bodyLarge
                        ),
                        TextSpan(
                          text: bodyText3,
                          style: Theme.of(context).textTheme.titleLarge
                        )
                      ]
                    ),
                  ),
                ),
                CustomSizedBox(
                  height: 173,
                ),
                Padding(
                  padding: PaddingConstants().horizontalSmall,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Theme.of(context).colorScheme.onBackground,
                    child: CustomSizedBox(
                      height: 60,
                      child: Center(
                        child: Text(
                          registerButtonText,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
                CustomSizedBox(
                  height: 20,
                ),
                Padding(
                  padding: PaddingConstants().horizontalSmall,
                  child: MaterialButton(
                    child: CustomSizedBox(
                      height: 60,
                      child: Center(
                        child: Text(
                          loginButtonText,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.whiteColor),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
                CustomSizedBox(
                  height: 44,
                ),
                CustomPrivacyPolicyText(),
                CustomSizedBox(
                  height: 27,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
