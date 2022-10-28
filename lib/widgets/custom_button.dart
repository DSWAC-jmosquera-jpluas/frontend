import 'package:citasmedicas/tools/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeConfig.safeBlockVertical * 50,
        width: SizeConfig.safeBlockHorizontal * 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockVertical * 15),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
