import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oneloc_use_case/app/imageConstants.dart';
import 'package:oneloc_use_case/features/home/homeProvider.dart';
import 'package:oneloc_use_case/features/home/homeResources.dart';
import 'package:oneloc_use_case/features/home/userDeleteModel.dart';
import 'package:oneloc_use_case/widgets/customSizedBox.dart';
import 'package:oneloc_use_case/app/paddingConstants.dart';
import 'package:oneloc_use_case/widgets/customSwitchTheme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget with HomeResources {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: SvgPicture.asset(ImageConstants.oneloc_appbar),
        actions: [
          CustomSwitchTheme(context)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomSizedBox(
              height: 90,
            ),
            SvgPicture.asset(ImageConstants.body_paint),
            CustomSizedBox(
              height: 74,
            ),
            Text(
              bodyText1,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            CustomSizedBox(
              height: 10,
            ),
            Text(
              bodyText2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            CustomSizedBox(
              height: 30,
            ),
            Padding(
              padding: PaddingConstants().horizontalSmall,
              child: MaterialButton(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Theme.of(context).colorScheme.error,
                child: CustomSizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      exitButtonText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  await context.read<HomeProvider>().logout();
                  Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false,);
                },
              ),
            ),
            Padding(
              padding: PaddingConstants().horizontalSmall,
              child: MaterialButton(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Theme.of(context).colorScheme.surface,
                elevation: 0,
                child: CustomSizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      deleteButtonText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  await context.read<HomeProvider>().deleteAccount();
                  Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false,);
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
