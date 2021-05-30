import 'package:app_tcesp/components/footer.dart';
import 'package:app_tcesp/model/menus_model.dart';
import 'package:app_tcesp/utils/lista_municipio.dart';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:flutter/material.dart';

import '../icons.dart';

class MunicipioScreen extends StatefulWidget {
  @override
  _MunicipioScreenState createState() => _MunicipioScreenState();
}

class _MunicipioScreenState extends State<MunicipioScreen> {
  String municipio;
  @override
  Widget build(BuildContext context) {
    GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(120, 69, 247, 1),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                MyFlutterApp.menu_hamburguer,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'TCESP',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      drawer: Scaffold(
        backgroundColor: Colors.transparent,
        body: MyDrawer(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 50),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(220, 141, 141, 1),
                    Color.fromRGBO(120, 69, 247, 1),
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Selecione o município\nque deseja acessar:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    SimpleAutoCompleteTextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Digite o município",
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 5.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25, vertical: 22),
                        focusColor: Colors.black,
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 45,
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      textSubmitted: (value) {
                        municipio = value;
                        print(municipio);
                        Navigator.pushNamed(
                          context,
                          '/home-screen',
                          arguments: municipio,
                        );
                      },
                      clearOnSubmit: true,
                      submitOnSuggestionTap: true,
                      key: key,
                      suggestions: listaMunicipio,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: FooterBuild(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuModel informacoesPublicas = new MenuModel(
        tituloMenu: "Informações Públicas",
        iconeMenu: MyFlutterApp.institucional_icon,
        bgColorMenu: Color.fromRGBO(120, 69, 247, 1));
    MenuModel despesas = new MenuModel(
        tituloMenu: "Despesas",
        iconeMenu: MyFlutterApp.contas_publicas,
        bgColorMenu: Color.fromRGBO(84, 70, 120, 1));
    MenuModel receitas = new MenuModel(
        tituloMenu: "Receitas",
        iconeMenu: MyFlutterApp.dashboard,
        bgColorMenu: Color.fromRGBO(174, 144, 249, 1));
    MenuModel licitacoes = new MenuModel(
        tituloMenu: "Licitações",
        iconeMenu: MyFlutterApp.contratacoes,
        bgColorMenu: Color.fromRGBO(50, 41, 71, 1));
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(120, 69, 247, 1),
            ),
            child: Container(
              child: Center(
                child: Text(
                  'TCESP - Por favor, selecione um município',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
