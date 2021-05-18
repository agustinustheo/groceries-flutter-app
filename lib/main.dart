import 'package:diantaraja_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/ui/splash/splash_page.dart';
import 'package:bloc_modul/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

void main() => runApp(
  MultiBlocProvider(
    providers:[
      BlocProvider(
        create: (_) => ListProductBloc(
          repository: ProductRepository()
        )..add(ListProductFetchData()),
      ),
      BlocProvider(
        create: (_) => CartBloc()
          ..add(CartFetchTotalCartQuantity())
          ..add(CartFetchData()),
      ),
      BlocProvider(
        create: (_) => SessionBloc(repository: SessionRepository())
      ),
    ],
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiantarAja Apps',
      theme: ThemeData(
        primarySwatch: ColorPalette.primaryThemeSwatch,
      ),
      home: SplashPage(),
    );
  }
}