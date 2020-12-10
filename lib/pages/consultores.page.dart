import 'package:flutter/material.dart';

String _dropdownValue = 'Todos os Consultores';

class ConsultoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: 200,
            child: Image.asset("assets/app-logo.png"),
          ),
        ),
        leading: Container(
          height: 40,
          width: 40,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage("assets/user-picture.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            width: 60,
            child: FlatButton(
              child: Icon(
                Icons.search,
                color: Color(0xFFBABABA),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            DropdownButton(
              value: _dropdownValue,
              elevation: 16,
              style: TextStyle(color: Colors.orange[700], fontSize: 20),
              underline: Container(
                height: 2,
                color: Colors.orange[700],
              ),
              onChanged: (String newValue) {
                _dropdownValue = newValue;
              },
              items: <String>[
                'Todos os Consultores',
                'Consultores Financeiros',
                'Consultores de Tecnologia',
                'Consultores de Recursos Humanos'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            consultoresItem(
                "Éder Germanio",
                "Consultor especialista em desenvolvimento de sistemas distribuídos, desenvolve usando PHP, Javascript, C++ e Visutal Basic, possui 25 anos de experiência trabalhando em grandes projetos.",
                "assets/post-picture-001.jpg"),
            consultoresItem(
                "Adalberto Costa",
                "Vivência em implementação de gestão de riscos: Risk Management, Payment Processing, Chargebacks Process, Product Management. Sólido conhecimento e experiência em mercado de adquirência e bandeiras, processos de compras online e off-line (captura, configuração de gateways, conversão);",
                "assets/post-picture-002.jpg"),
            consultoresItem(
                "Maurício Gomes da Silva",
                "Coordena as atividades de desenvolvimento do setor de pessoal, toda rotina de pessoal, folha de pagamento admissões, rescisões, férias, e-social, benefícios, convênios, acompanhamento dos encargos sociais, estruturação e reestruturação dos processos do setor, acompanhamento de indicadores. Acompanhamento implantação Cargos e Salários, projetos da área de DP.",
                "assets/post-picture-003.jpg"),
            consultoresItem(
                "Gabriel da Silva Gonçalves",
                "Profissional dinâmico e de fácil adaptação a novas técnicas de trabalho, estando sempre interessada a novos saberes com dedicação, responsabilidade, proatividade e eficácia. Como pontos fortes, destaco facilidade em tomadas de decisões, visão ampla, força de vontade, disposição e energia. Ampla experiência em Recrutamento & Seleção em cargos operacionais,administrativos e estratégicos.",
                "assets/post-picture-004.jpg"),
            consultoresItem(
                "Renato Perereira Alburqueque",
                "Atuando na área financeira há alguns anos, possuo experiência nas áreas de planejamento estratégico, Controladoria e tesouraria. Atualmente sou responsável por todo o setor financeiro (Planejamento, Métricas e KPIs, Controladoria e tesouraria), em uma startup de Tecnologia, modelo Saas, onde atuo desde o início da operação.",
                "assets/post-picture-005.jpg"),
            consultoresItem(
                "Ricardo Costa Martins",
                "Formado em direito pela PUC/MG, entusiasta na área, mas sempre buscando novos conhecimentos e abrangendo habilidades, através de experiências laborais. Profissional multidisciplinar com foco em executar tarefas de maneira organizada, tendo como objetivo solucionar problemas, focando em resultados e em alcançar metas com criatividade e atenção às novas tendências do mercado com dinamismo e proatividade.",
                "assets/post-picture-006.jpg"),
          ],
        ),
      ),
    );
  }
}

Widget consultoresItem(
    String _nomeConsultor, String _descricaoConsultor, String _imagem) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            _nomeConsultor,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(child: Image.asset(_imagem)),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(_descricaoConsultor),
        )
      ],
    ),
  );
}
