import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';

class BannerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizes.dp12(context)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          StringImageAsset.homeBanner,
          fit: BoxFit.cover,
          height: Sizes.width(context) / 4,
          width: Sizes.width(context),
        ),
      ),
    );
  }
}
