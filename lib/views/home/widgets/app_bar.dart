import 'package:brandie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(Dimens.eighty);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimens.thirty),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AssetConstants.aiAssistant,), 
          Image.asset(AssetConstants.logo, height: Dimens.fifty),
          SvgPicture.asset(AssetConstants.camera),
        ],
      ),
    );
  }
}
