import 'package:app_tcesp/screens/screen_despesas.dart';
import 'package:app_tcesp/screens/screen_despesas_form.dart';
import 'package:app_tcesp/screens/screen_home.dart';
import 'package:app_tcesp/screens/screen_informacao_financeira.dart';
import 'package:app_tcesp/screens/screen_licitacoes.dart';
import 'package:app_tcesp/screens/screen_municipio.dart';
import 'package:app_tcesp/screens/screen_receita.dart';
import 'package:app_tcesp/screens/screen_receitas_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MunicipioScreen(),
        '/home-screen': (context) => HomeScreen(),
        '/informacao-financeira': (context) => InformacaoFinanceiraScreen(),
        '/despesas-form': (context) => DespesasScreenForm(),
        '/despesas': (context) => DespesasScreen(),
        '/receita-form': (context) => ReceitaScreenForm(),
        '/receita': (context) => ReceitaScreen(),
        '/licitacoes': (context) => LicitacoesScreen(),
      }
    );
  }
}