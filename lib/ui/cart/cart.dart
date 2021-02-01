import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/cart/delivery.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          'Keranjang',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        backgroundColor:Colors.blue[400]
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: Sizes.dp28(context),
          left: Sizes.dp28(context),
          right: Sizes.dp28(context)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ringkasan Belanja',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.dp18(context),
                color: Colors.grey[700],
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Sizes.dp14(context)),
            Container(
              padding: EdgeInsets.all(Sizes.dp12(context)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          'https://d25rq8gxcq0p71.cloudfront.net/dictionary-images/324/small.jpg',
                          fit: BoxFit.cover,
                          width: Sizes.width(context) / 8,
                          height: Sizes.width(context) / 8,
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
                              'Dog',
                              style: TextStyle(
                                fontSize: Sizes.dp14(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              '1 dog',
                              style: TextStyle(
                                fontSize: Sizes.dp12(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Rp30000,-',
                        style: TextStyle(
                          fontSize: Sizes.dp12(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[400]
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          'https://d25rq8gxcq0p71.cloudfront.net/dictionary-images/324/small.jpg',
                          fit: BoxFit.cover,
                          width: Sizes.width(context) / 8,
                          height: Sizes.width(context) / 8,
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
                              'Dog',
                              style: TextStyle(
                                fontSize: Sizes.dp14(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              '1 dog',
                              style: TextStyle(
                                fontSize: Sizes.dp12(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Rp30000,-',
                        style: TextStyle(
                          fontSize: Sizes.dp12(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[400]
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: Sizes.dp14(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: Sizes.dp28(context),
                      ),
                      Text(
                        'Rp30000,-',
                        style: TextStyle(
                          fontSize: Sizes.dp12(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[400]
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              )
            ),
            SizedBox(height: Sizes.dp14(context)),
            Text(
              'Informasi Pembayaran',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.dp18(context),
                color: Colors.grey[700],
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Sizes.dp14(context)),
            Container(
              padding: EdgeInsets.all(Sizes.dp20(context)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Text(
                'Pembayaran dapat dilakukan melalui nomor rekening berikut: \n\nBCA: 123456\nMandiri: 123'
              )
            ),
            SizedBox(height: Sizes.dp14(context)),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                color: Colors.blue[400],
                onPressed: () => Navigation.intentWithoutBack(context, DeliveryPage()),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                  child: Text(
                    "Lanjutkan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.dp16(context),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
