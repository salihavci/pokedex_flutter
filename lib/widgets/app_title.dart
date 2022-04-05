// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_flutter/constants/poke_constants.dart';
import 'package:pokedex_flutter/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              child: Text(
                Constants.title,
                style: Constants.getTitleStyle(),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Align(
            child: Image.asset(
              Constants.pokeballImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
