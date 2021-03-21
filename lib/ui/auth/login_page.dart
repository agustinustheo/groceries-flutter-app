import 'package:diantaraja_mobile/ui/auth/register_page.dart';
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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

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
          return loginForm(context);
        },
      ),
    );
  }

  Widget loginForm(BuildContext context){
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: Sizes.dp30(context),
                  right: Sizes.dp30(context)
                ),
                child: SizedBox(
                  height: Sizes.dp60(context),
                  width: Sizes.dp60(context),
                  child: Image.asset(StringImageAsset.logo)
                )
              ),
              CustomTextFormField(
                _emailController, 
                hintText: "Email",
                padding: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  top: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                ),
              ),
              CustomTextFormField(
                _passwordController, 
                hintText: "Kata Sandi",
                obscureText: true,
                suffixIcon: Icon(CustomIcons.lock),
                padding: EdgeInsets.all(
                  Sizes.dp16(context)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Sizes.dp4(context),
                  right: Sizes.dp28(context),
                  bottom: Sizes.dp4(context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Center(
                        child: MontserratText(
                          "Lupa kata sandi?"
                        ),
                      ),
                    ),
                  ]
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
                  "Masuk",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                onPressed: () {
                  var _repository = new CustomerRepository();
                  _repository.login(_emailController.text, _passwordController.text)
                    .then((res){
                      BlocProvider.of<SessionBloc>(context).add(SessionFetchData());
                    })
                    .catchError((ex){
                      if(ex is ApiException){
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Error",
                          desc: ex.message
                        ).show();
                      }
                    });
                },
              ),
              FullFlatButton(
                margin: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  top: Sizes.dp16(context),
                  right: Sizes.dp16(context)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,// Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Image.asset(StringImageAsset.googleLogo, width: Sizes.dp18(context),height:Sizes.dp18(context) ,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Sizes.dp6(context)),
                      child: MontserratText(
                        "Masuk dengan Google",
                        textColor: ColorPalette.textGrey
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Sizes.dp16(context),
                  bottom: Sizes.dp24(context)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MontserratText(
                        "Belum punya akun? Daftar ",
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigation.intent(context, RegisterPage());
                        },
                        child: MontserratText(
                          "di sini",
                          textColor: ColorPalette.textLoginBlue,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}