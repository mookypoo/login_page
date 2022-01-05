import 'package:flutter/material.dart';
import 'package:login_page/service/loginPageService.dart';

class AndroidMain extends StatefulWidget {
  AndroidMain({Key? key}) : super(key: key);

  @override
  State<AndroidMain> createState() => _AndroidMainState();
}

class _AndroidMainState extends State<AndroidMain> {
  TextEditingController _pw1 = TextEditingController();
  bool _obscurePw1 = true;
  bool _obscurePw2 = true;

  bool _checked = false;

  bool _isMale = false;
  bool _isFemale = false;

  Widget _textFieldWidget({
    TextEditingController? textCt,
    required double width,
    required BuildContext context,
    required String hintText,
    bool? obscureText,
    Widget? suffixIcon,
    EdgeInsets padding = const EdgeInsets.only(top: 20.0, right: 5.0, left: 5.0),
  }) {
    return Container(
      padding: padding,
      width: width,
      child: TextField(
        controller: textCt,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3.0),
          isDense: true,
          hintText: hintText,
          suffix: suffixIcon ?? null,
          suffixStyle: TextStyle(),
        ),
        obscureText: obscureText ?? false,
      ),
    );
  }

  Widget _genderWidget({required IconData icon, required bool gender}) {
    return GestureDetector(
      onTap: () => this.setState(() {
        /* 대충 짜느라 걍 border 보기위해 */
        this._isMale = !this._isMale;
      }),
      child: Container(
        margin: EdgeInsets.only(left: 15.0),
        decoration: BoxDecoration(
          border: gender ? Border.all() : null,
        ),
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.network(
                  LoginPageService.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromRGBO(255, 255, 255, 0.75),
                            Color.fromRGBO(255, 255, 255, 1.0),
                          ],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, -0.7),
                        ),
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 0.0,
                      right: 0.0,
                      child: Icon(
                        Icons.person_add_alt,
                        size: MediaQuery.of(context).size.width * 0.20,
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: 10.0 + MediaQuery.of(context).size.width * 0.20 + 5.0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                this._textFieldWidget(
                                  width: MediaQuery.of(context).size.width * 0.39,
                                  context: context,
                                  hintText: "First Name",
                                ),
                                this._textFieldWidget(
                                  width: MediaQuery.of(context).size.width * 0.39,
                                  context: context,
                                  hintText: "Last Name",
                                ),
                              ],
                            ),
                            this._textFieldWidget(
                              width: MediaQuery.of(context).size.width * 0.80,
                              context: context,
                              hintText: "Email",
                            ),
                            this._textFieldWidget(
                              padding: EdgeInsets.only(top: 20.0, right: 5.0, left: 5.0, bottom: 5.0),
                              width: MediaQuery.of(context).size.width * 0.80,
                              context: context,
                              hintText: "Mobile",
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 4.0),
                              margin: EdgeInsets.only(left: 10.0, top: 13.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Select Gender", style: TextStyle(fontSize: 16.0,)),
                                  this._genderWidget(icon: Icons.male_outlined, gender: this._isMale,),
                                  this._genderWidget(icon: Icons.female_outlined, gender: this._isFemale,),
                                ],
                              ),
                            ),
                            this._textFieldWidget(
                              width: MediaQuery.of(context).size.width * 0.80,
                              context: context,
                              hintText: "Password",
                              obscureText: this._obscurePw1,
                              suffixIcon: IconButton(
                                constraints: BoxConstraints(
                                  maxHeight: 20.0,
                                ),
                                padding: EdgeInsets.all(0.0),
                                icon: Icon(Icons.remove_red_eye_outlined, size: 20.0),
                                onPressed: () {
                                  this.setState(() {
                                    this._obscurePw1 = !this._obscurePw1;
                                  });
                                },
                              ),
                            ),
                            this._textFieldWidget(
                              width: MediaQuery.of(context).size.width * 0.80,
                              context: context,
                              hintText: "Confirm Password",
                              obscureText: this._obscurePw2,
                              suffixIcon: IconButton(
                                visualDensity: VisualDensity.compact,
                                constraints: BoxConstraints(
                                  maxHeight: 20.0,
                                ),
                                padding: EdgeInsets.all(0.0),
                                icon: Icon(Icons.remove_red_eye_outlined, size: 20.0),
                                onPressed: () {},
                              ),
                            ),
                            /* 그냥 checkbox 쓰고싶은데 사이즈 조절이 안되네요 ㅠ */
                            Container(
                              width: MediaQuery.of(context).size.width * 0.79,
                              margin: EdgeInsets.all(12.0),
                              child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () => this.setState(() {
                                        this._checked = !this._checked;
                                      }),
                                      child: Stack(
                                        children: <Widget>[
                                          Icon(Icons.check, size: 27.0,
                                            color: this._checked ? Color.fromRGBO(0,0,0, 1.0) : Color.fromRGBO(255, 255, 255, 0.0),),
                                          Positioned(
                                            bottom: 5.0,
                                            left: 5.0,
                                            child: Container(
                                              width: 14.0,
                                              height: 14.0,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5.0, top: 10.0),
                                      width: MediaQuery.of(context).size.width * 0.68,
                                      child: Text(
                                        "By proceeding, I agree to Mooky's Terms of Use and Conditions.",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          decoration: this._checked ? TextDecoration.underline : null,
                                        ),
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 0.0,
                      right: 0.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(7.0),
                            width: MediaQuery.of(context).size.width * 0.23,
                            height: MediaQuery.of(context).size.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(0, 96, 255, 1.0),
                                  Color.fromRGBO(255, 132, 188, 1.0)
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Already Registered ?"),
                                TextButton(
                                  child: Text("Login"),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
