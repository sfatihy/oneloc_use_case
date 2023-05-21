import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {

  double? height;
  double? width;
  Widget? child;

  CustomSizedBox({
    Key? key,
    //this.width = double.infinity,
    //this.height = double.infinity,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){

    final double gen = MediaQuery.of(context).size.width;
    final double yuk = MediaQuery.of(context).size.height;

    width ??= gen;
    height ??= 0;

    return SizedBox(
      height: yuk / (852 / height!),
      width: gen / (393 / width!),
      child: child,
    );
  }
}
