import 'package:flutter/material.dart';
import 'package:main/user_model.dart';
import 'ProgressHUD.dart';
import 'api_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassWord = true;
  late LoginRequesetModel requesetModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requesetModel = new LoginRequesetModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      key: null,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).accentColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ]),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => requesetModel.email = input!,
                        validator: (input) => !input!.contains("@")
                            ? "Email Id should be Vaiud"
                            : null,
                        decoration: new InputDecoration(
                            hintText: "Email",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).accentColor,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => requesetModel.password = input!,
                        validator: (input) =>
                            input!.length < 3 ? "더 길게 적으세여" : null,
                        obscureText: hidePassWord,
                        decoration: new InputDecoration(
                          hintText: "PassWord",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).accentColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassWord = !hidePassWord;
                              });
                            },
                            color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                            icon: Icon(hidePassWord
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                "로그인",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 80,
                                ),
                                backgroundColor: Theme.of(context).accentColor,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {
                                if (validateAndSave()) {
                                  setState(() {
                                    isApiCallProcess = true;
                                  });

                                  APIService apiService = new APIService();
                                  apiService.login(requesetModel).then((value) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value.token.isNotEmpty) {
                                      print(value.token);
                                      final snackBar = SnackBar(
                                        content: Text("로그인성공!!!!"),
                                      );
                                      scaffoldKey.currentState!
                                          .showSnackBar(snackBar);
                                    } else {
                                      final snackBar = SnackBar(
                                        content: Text(value.error),
                                      );
                                      scaffoldKey.currentState!
                                          .showSnackBar(snackBar);
                                    }
                                  });
                                  print(requesetModel.toJson());
                                }
                              },
                            ),
                            TextButton(
                              child: Text(
                                "회원가입",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 80,
                                ),
                                backgroundColor: Theme.of(context).accentColor,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
