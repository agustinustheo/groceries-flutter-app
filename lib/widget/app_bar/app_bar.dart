import 'package:bloc_modul/bloc.dart';
import 'package:flutter/material.dart';
import 'package:repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_modul/bloc/home/list_product_bloc.dart';

class ProductAppBar extends StatefulWidget implements PreferredSizeWidget {
  ProductAppBar()
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0
  final bool addBackButton = true;
  final Color appBarColor = Colors.blue[400];

  @override
  _ProductAppBarState createState() => _ProductAppBarState();
}

class _ProductAppBarState extends State<ProductAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListProductBloc(repository: ProductRepository())
        ..add(SearchData(text: '')),
      child: AppBar(
        backgroundColor: widget.appBarColor,
        automaticallyImplyLeading: widget.addBackButton,
        leading: IconButton(
          icon: widget.addBackButton
              ? Icon(Icons.arrow_back_ios_rounded)
              : Icon(Icons.menu),
          onPressed: () {
            if (Scaffold.of(context).hasDrawer) {
              Scaffold.of(context).openDrawer();
            } else if (widget.addBackButton) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
