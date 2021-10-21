import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({ Key? key }) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = const AssetImage("images/padrao.png");
  var _mensagem = "Escolha do oponente";

  void _opcaoSelecionada(String escolhaUsuario) {
    
    var _opcoes = ["pedra", "papel", "tesoura"];

    var numero = Random().nextInt(_opcoes.length);
    var _escolhaApp = _opcoes[numero];
    print('usuario' + escolhaUsuario);
    print('app' + _escolhaApp);

    switch(_escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = const AssetImage("images/tesoura.png");
        });
        break;
      default:
        _imagemApp = const AssetImage("images/padrao.png");
        break;
    }

    if( (escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && _escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && _escolhaApp == "papel")
     ) {
       setState(() {
         _mensagem = "Você ganhou!!";
        });
    } else if (
      (_escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (_escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (_escolhaApp == "tesoura" && escolhaUsuario == "papel")
    ){
      setState(() {
         _mensagem = "Você perdeu!!";
        });
    } else {
      setState(() {
         _mensagem = "Empate";
        });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jockenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //text
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do oponente",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          //imagem
          Image(image: _imagemApp,),
          //text
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          //3 imagens
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"), 
                child: Image.asset("images/pedra.png", height: 95,)
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"), 
                child: Image.asset("images/papel.png", height: 95,)
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"), 
                child: Image.asset("images/tesoura.png", height: 95,)
              ),
            ],
          ),
        ],
      ),
    );
  }
}

