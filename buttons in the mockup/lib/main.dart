import 'package:flutter/widgets.dart';
main()=>runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
        color: Color(0xFFACDF87),
        child: Conteudo(),
      ),
    );
  }
}

class Conteudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Contador('Go back'),
        Row(
            children: <Widget>[
              Contador('Lectures'),
              Contador('Networking'),
            ],
        ),
        Row(
          children: <Widget>[
            Contador('Food'),
            Contador('workshops'),
          ],
        ),
        Row(
          children: <Widget>[
            Contador('wc'),
            Contador('exits'),
          ],
        )

      ],
    );
  }
}

class Contador extends StatefulWidget {
  final String _nome;
  Contador(this._nome);

  @override
  State<Contador> createState()=>_ContadorEstado();
}

class _ContadorEstado extends State<Contador> {
  int conta = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2BB143)),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // [widget] é a propriedade que a classe estao armazena
          // a instancia do [StatefulWidget] ([Contador] no nosso caso)
          _ContadorRotulo(widget._nome),
          _ContadorBotao(
              conta,
              onPressed: () {
                setState((){
                  ++conta;
                });
              }
          )
        ],
      ),
    );
  }
}

class _ContadorRotulo extends StatelessWidget {
  static const textStyle = TextStyle(
    color: Color(0xFF1A237E),
    fontSize: 26.0,
  );

  final String _rotulo;
  _ContadorRotulo(this._rotulo);

  @override
  Widget build(BuildContext context) {
    return Text(
      _rotulo,
      style: _ContadorRotulo.textStyle,
    );
  }
}

class _ContadorBotao extends StatelessWidget {
  final conta;
  final onPressed;
  _ContadorBotao(this.conta, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
            color: Color(0xFFFD6A02),
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Center(
          child: Text(
              '$conta',
              style: TextStyle(fontSize: 20.0)
          ),
        ),
      ),
    );
  }
}


