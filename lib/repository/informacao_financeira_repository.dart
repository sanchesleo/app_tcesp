import 'package:app_tcesp/model/informacao_financeiras_model.dart';

class InformacaoFinanceiraRepository{
  var listAllInformacoesFinanceiras = <InformacoesFinanceirasModel>[
      new InformacoesFinanceirasModel(
        menu: 'Plano Plurianual',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
      new InformacoesFinanceirasModel(
        menu: 'Leis de Diretrizes\nOrçamentários',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
      new InformacoesFinanceirasModel(
        menu: 'Prestação de Contas',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
      new InformacoesFinanceirasModel(
        menu: 'Relatório Resumido da Execução Orçamentária',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
      new InformacoesFinanceirasModel(
        menu: 'Relatório de Gestão Fiscal',
        conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid',
      ),
    ];
  Future<List<InformacoesFinanceirasModel>> ListAllInformacoesFinanceiras() async{
    await Future.delayed(
      Duration(
        seconds:3,
      ),
    );
    return Future.value(listAllInformacoesFinanceiras);
  }
}