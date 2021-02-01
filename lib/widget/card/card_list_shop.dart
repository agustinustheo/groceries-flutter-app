import 'package:diantaraja_mobile/ui/cart/cart.dart';
import 'package:diantaraja_mobile/ui/cart/delivery.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class CardListShop extends StatelessWidget {

  final int width;
  final int height;
  final String urlProductImage;
  final String urlBrandImage;
  final String productName;
  final String price;

  const CardListShop({Key key, this.width, this.height, this.urlProductImage, this.urlBrandImage, this.productName, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.intent(context, CartPage());
      },
      child: Container(
        padding: EdgeInsets.all(Sizes.dp4(context)),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(Sizes.dp6(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(
                      urlBrandImage,
                      fit: BoxFit.cover,
                      width: Sizes.width(context) / 10,
                      height: Sizes.width(context) / 10,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.dp12(context),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          productName,
                          style: TextStyle(fontSize: Sizes.dp14(context), fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                        ),
                        Text(
                          price,
                          style: TextStyle(color: Colors.grey, fontSize: Sizes.dp12(context), fontFamily: 'Montserrat',),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizes.dp4(context),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(Sizes.dp4(context)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(
                    urlProductImage,
                    fit: BoxFit.contain
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
