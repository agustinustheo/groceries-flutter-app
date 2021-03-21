import 'package:diantaraja_mobile/widget/alert_dialog/pop_up_alert.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_simple.dart';
import 'package:diantaraja_mobile/widget/button/custom_button.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:diantaraja_mobile/widget/textformfield/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/ui/intro/intro_page.dart';
import 'package:bloc_modul/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>{
  TextEditingController _emailController = new TextEditingController();

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
          return registerForm(context);
        },
      ),
    );
  }

  Widget registerForm(BuildContext context){
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
              "Lupa Kata Sandi",
              margin: EdgeInsets.only(
                bottom: Sizes.dp25(context)
              ),
              textColor: Colors.blue[400],
              fontSize: Sizes.dp25(context),
              fontWeight: FontWeight.bold
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dp4(context),
                bottom: Sizes.dp4(context),
              ),
              child: GestureDetector(
                onTap: (){},
                child: Center(
                  child: MontserratText(
                    "Kami akan mengirimkan tautan atau \nkode untuk kembali ke akun Anda.",
                    fontSize: Sizes.dp12(context),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextFormField(
              _emailController, 
              hintText: "Email",
              padding: EdgeInsets.all(
                Sizes.dp16(context)
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
                return showAlert(
                  context: context,
                  alertType: AlertType.success,
                  title: "Email Terkirim",
                  desc: "Silahkan periksa kotak masuk atau\nfolder spam pada email Anda.", 
                  dialogs: [],
                  isButtonVisible: false,
                  isCloseButton: false
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}