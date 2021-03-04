import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_modul/bloc/home/list_product_bloc.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Cari...'
          ),
          onChanged: (text) {
            text = text.toLowerCase();
            BlocProvider.of<ListProductBloc>(context).add(
              SearchData(text: text)
            );
          },
        ),
      ),
    );
  }
}
