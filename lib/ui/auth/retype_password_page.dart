import 'package:diantaraja_mobile/ui/auth/login_page.dart';
import 'package:diantaraja_mobile/widget/alert_dialog/pop_up_image.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_simple.dart';
import 'package:diantaraja_mobile/widget/button/custom_button.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:diantaraja_mobile/widget/textformfield/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/custom_icons.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'package:diantaraja_mobile/ui/intro/intro_page.dart';
import 'package:bloc_modul/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RetypePasswordPage extends StatefulWidget {
  @override
  _RetypePasswordPageState createState() => _RetypePasswordPageState();
}

class _RetypePasswordPageState extends State<RetypePasswordPage>{
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SessionBloc(repository: SessionRepository())..add(SessionFetchData()),
      child: BlocConsumer<SessionBloc, SessionState>(
        listener: (context,state){
          if(state is SessionFetchSuccessState){
            Navigation.intentWithoutBack(context, IntroPage());
          }
        },
        builder: (context,state){
          return retypePassword(context);
        },
      ),
    );
  }

  Widget retypePassword(BuildContext context){
    return Scaffold(
      appBar: SimpleAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: Sizes.dp30(context),
            ),
            MontserratText(
              "Atur Ulang Kata Sandi",
              margin: EdgeInsets.only(
                bottom: Sizes.dp25(context)
              ),
              textColor: Colors.blue[400],
              fontSize: Sizes.dp25(context),
              fontWeight: FontWeight.bold
            ),
            CustomTextFormField(
              _passwordController, 
              hintText: "Kata Sandi Baru",
              obscureText: true,
              suffixIcon: Icon(CustomIcons.lock),
              padding: EdgeInsets.all(
                  Sizes.dp16(context)
              ),
            ),
            CustomTextFormField(
              _confirmPasswordController, 
              hintText: "Konfirmasi Kata Sandi",
              obscureText: true,
              suffixIcon: Icon(CustomIcons.lock),
              padding: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                  bottom: Sizes.dp16(context)
              ),
            ),
            FullFlatButton(
              backgroundColor: Colors.blue[400],
              margin: EdgeInsets.only(
                left: Sizes.dp16(context),
                top: Sizes.dp16(context),
                right: Sizes.dp16(context)
              ),
              child: MontserratText(
                "Kirim",
                textColor: Colors.white,
                fontWeight: FontWeight.bold
              ),
              onPressed: () {
                showImageAlert(
                  context: context, 
                  image: Image.asset(
                    StringImageAsset.delivery,
                    width: Sizes.dp60(context)
                  ),
                  title: "Ubah Kata Sandi Berhasil", 
                  desc: "Kata sandi Anda berhasil diperbaharui.\nYuk masuk dan mulai belanja sekarang!", 
                  dialogs: [
                    DialogButton(
                      child: MontserratText(
                        "Masuk",
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      onPressed: () => Navigation.intentWithoutBack(context, LoginPage()),
                    )
                  ]
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}