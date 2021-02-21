import 'package:bloc_modul/bloc/home/list_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:diantaraja_mobile/widget/alert_dialog/pop_up_banner.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_home.dart';
import 'package:diantaraja_mobile/widget/banner/banner_home.dart';
import 'package:diantaraja_mobile/widget/card/card_list_shop.dart';
import 'package:diantaraja_mobile/widget/header/space_header.dart';
import 'package:repository/repository.dart';
import 'package:network/model/list_product.dart';
import 'package:network/network.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _showBannerDialog() {
    Navigator.push(
      context,
      HeroDialogRoute(
        builder: (BuildContext context) {
          return Center(
              child: Container(
                margin: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: 'banner-hero',
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            StringImageAsset.homeBanner,
                            height: Sizes.width(context) / 1,
                            width: Sizes.width(context) / 1,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: FlatButton(
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigation.back(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListProductBloc(repository: Repository())..add(FetchData()),
      child: Scaffold(
        drawer: Drawer(),
        appBar: CustomAppBar(
          appBarColor: Colors.blue[400],
          addBackButton: false,
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: Sizes.width(context) / 3,
                pinned: false,
                floating: true,
                leading: Container(),
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _showBannerDialog();
                        },
                        child: Hero(
                          tag: 'banner-hero',
                          child: BannerHome(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container(
            color: Colors.transparent,
            height: Sizes.height(context),
            width: Sizes.width(context),
            child: EasyRefresh(
              header: SpaceHeader(),
              onRefresh: () async {},
              onLoad: null,
              child: BlocConsumer<ListProductBloc, ListProductState>(
                listener: (context,state){},
                builder: (context,state){
                  if(state is FetchSuccessState){
                    return StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      primary: false,
                      crossAxisCount: 4,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      itemCount: state.listProduct.listProduct.length,
                      itemBuilder: (context, index) {
                        return CardListShop(
                          width: state.listProduct.listProduct[index].width,
                          height: state.listProduct.listProduct[index].height,
                          urlProductImage: state.listProduct.listProduct[index].productImage,
                          urlBrandImage: state.listProduct.listProduct[index].brandImage,
                          productName: state.listProduct.listProduct[index].productName,
                          price: state.listProduct.listProduct[index].productPrice.toString(),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                    );
                  }else if(state is FetchFailedState){
                    return Text(
                      "Error fetch data",
                      style: TextStyle(color: Colors.red),
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
//              StreamBuilder(
//                stream: bloc_product.allProduct,
//                builder: (context, AsyncSnapshot<ListProduct> snapshot) {
//                  if (snapshot.hasData) {
//                    return StaggeredGridView.countBuilder(
//                      shrinkWrap: true,
//                      primary: false,
//                      crossAxisCount: 4,
//                      mainAxisSpacing: 4.0,
//                      crossAxisSpacing: 4.0,
//                      itemCount: snapshot.data.listProduct.length,
//                      itemBuilder: (context, index) {
//                        return CardListShop(
//                          width: snapshot.data.listProduct[index].width,
//                          height: snapshot.data.listProduct[index].height,
//                          urlProductImage: snapshot.data.listProduct[index].productImage,
//                          urlBrandImage: snapshot.data.listProduct[index].brandImage,
//                          productName: snapshot.data.listProduct[index].productName,
//                          price: snapshot.data.listProduct[index].productPrice.toString(),
//                        );
//                      },
//                      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
//                    );
//                  } else if (snapshot.hasError) {
//                    return Text(
//                      snapshot.error.toString(),
//                      style: TextStyle(color: Colors.red),
//                    );
//                  }
//                  return Center(
//                    child: CircularProgressIndicator(),
//                  );
//                },
//              ),
            ),
          ),
        ),
      ),
    );
  }
}
