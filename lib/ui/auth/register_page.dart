import 'package:diantaraja_mobile/ui/auth/login_page.dart';
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

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MontserratText(
                "Daftar Sekarang!",
                margin: EdgeInsets.only(
                  bottom: Sizes.dp25(context)
                ),
                textColor: Colors.blue[400],
                fontSize: Sizes.dp25(context),
                fontWeight: FontWeight.bold
              ),
              CustomTextFormField(
                _nameController, 
                hintText: "Nama Lengkap",
                padding: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                  bottom: Sizes.dp16(context)
                ),
              ),
              CustomTextFormField(
                _emailController, 
                hintText: "Email",
                padding: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                  bottom: Sizes.dp16(context)
                ),
              ),
              CustomTextFormField(
                _passwordController, 
                hintText: "Kata Sandi",
                obscureText: true,
                suffixIcon: Icon(CustomIcons.lock),
                padding: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                  bottom: Sizes.dp16(context)
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
              CustomTextFormField(
                _phoneController, 
                hintText: "Nomor Handphone",
                padding: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                  bottom: Sizes.dp16(context)
                ),
              ),
              CustomTextFormField(
                _addressController, 
                hintText: "Alamat",
                padding: EdgeInsets.only(
                  left: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                  bottom: Sizes.dp16(context)
                ),
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
                      "Dengan membuat akun, saya telah setuju dengan\nSyarat & Ketentuan serta Kebijakan Privasi yang berlaku.",
                      fontSize: Sizes.dp12(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                  "Daftar",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                onPressed: () {
                  var _repository = new CustomerRepository();
                  _repository.register(new Customer(
                    customerName: _nameController.text,
                    customerEmail: _emailController.text,
                    customerPassword: _passwordController.text,
                    customerPhone: _phoneController.text,
                    customerAddress: _addressController.text
                  ))
                    .then((res){
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Registration Success",
                        desc: "Please confirm your email address to complete your registration",
                        closeFunction: (){
                          Navigation.intent(context, LoginPage());
                        }
                      ).show();
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
                        "Daftar dengan Google",
                        textColor: ColorPalette.textGrey
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}