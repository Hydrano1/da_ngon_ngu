import 'package:da_ngon_ngu/classes/language.dart';
import 'package:da_ngon_ngu/localization/demo_localization.dart';
import 'package:da_ngon_ngu/localization/localization_constants.dart';
import 'package:da_ngon_ngu/main.dart';
import 'package:da_ngon_ngu/routes/route_name.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'vi':
        _temp = Locale(language.languageCode, 'VN');
        break;
      case 'ko':
        _temp = Locale(language.languageCode, 'KR');
        break;
      case 'ja':
        _temp = Locale(language.languageCode, 'JP');
        break;
      default:
        _temp = Locale(language.languageCode, 'US');
    }
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(),
      appBar: AppBar(
        title: Text(getTranslated(context, 'home_page')),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.langugeList
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          children: <Widget>[
                            Text(lang.flag),
                            Text(lang.name, style: TextStyle(fontSize: 30))
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: _mainForm(context),
        ),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                getTranslated(context, 'personal_info'),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) return 'required fied';
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: getTranslated(context, 'name'),
              hintText: getTranslated(context, 'name_hint'),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) return 'required fied';
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: getTranslated(context, 'email'),
              hintText: getTranslated(context, 'email_hint'),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: getTranslated(context, 'date_of_birth'),
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 20),
              );
            },
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              if (_key.currentState.validate()) {
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                getTranslated(context, 'submit_info'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(getTranslated(context, 'about_us'), style: _textStyle),
            onTap: () {
              // to close the navigator
              Navigator.pop(context);
              // Navigator to about pages
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'setting'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingRoute);
            },
          ),
        ],
      ),
    );
  }
}
