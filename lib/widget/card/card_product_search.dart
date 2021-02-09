import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class CardProductSearch extends StatelessWidget {

  final int width;
  final int height;
  final String urlProductImage;
  final String productName;
  final String productUnit;
  final String price;

  const CardProductSearch({Key key, this.width, this.height, this.urlProductImage, this.productName, this.productUnit, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dp16(context)),
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
                  urlProductImage,
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
                      productName,
                      style: TextStyle(
                        fontSize: Sizes.dp14(context),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '1 ' + productUnit,
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
                'Rp ' + price.toString() + ',-',
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
            children: <Widget>[
              InkWell(
                onTap: (){

                },
                child: Container(
                  width: Sizes.dp24(context),
                  height: Sizes.dp24(context),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    shape: BoxShape.circle
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "-",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.dp20(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Sizes.dp4(context),
              ),
              Container(
                width: Sizes.dp28(context),
                child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '0',
                    counterText: "",
                    isDense: true
                  ),                                 
                  style: TextStyle(
                    fontSize: Sizes.dp12(context)                
                  )
                ),
              ),
              SizedBox(
                width: Sizes.dp4(context),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  width: Sizes.dp24(context),
                  height: Sizes.dp24(context),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    shape: BoxShape.circle
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "+",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.dp20(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

