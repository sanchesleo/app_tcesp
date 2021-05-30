import 'package:app_tcesp/components/drawer.dart';
import 'package:app_tcesp/components/footer.dart';
import 'package:app_tcesp/model/menus_model.dart';
import 'package:flutter/material.dart';

import '../icons.dart';

class DespesasScreenForm extends StatefulWidget {
  @override
  _DespesasScreenFormState createState() => _DespesasScreenFormState();
}

class _DespesasScreenFormState extends State<DespesasScreenForm> {
  
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  @override
  var listaAnos = <String>[
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021"
  ];
  var anoEscolhido;

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
    String municipio = ModalRoute.of(context).settings.arguments;
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
          'Despesas',
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
        body: MyDrawer(municipio: municipio,informacoesPublicas: informacoesPublicas, despesas: despesas, receitas: receitas, licitacoes: licitacoes),
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
                  ],
                ),
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Ano para verificar a\ndespesa:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: <Widget>[
                      DropdownButtonFormField<String>(
                        hint: Text(
                          "Selecione o ano:",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: anoEscolhido,
                        onChanged: (newValue) {
                          setState(() {
                            anoEscolhido = newValue;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Selecione um ano' : null,
                        onSaved: (newValue) {
                          anoEscolhido = newValue;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.7),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          fillColor: Colors.white,
                          //  hoverColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 5.0,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                        ),
                        items: listaAnos.map((String ano) {
                          return DropdownMenuItem<String>(
                            value: ano,
                            child: Text(
                              ano,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                print('$anoEscolhido');
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(218, 142, 149, 0.65),
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text(
                                'Voltar ao Menu',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  print('$anoEscolhido');
                                  Navigator.pushNamed(
                                    context,
                                    '/despesas',
                                    arguments: anoEscolhido,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(218, 142, 149, 0.65),
                                  padding: EdgeInsets.symmetric(vertical: 12)),
                              child: Text(
                                'Acessar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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