import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variaveis que serao utilizadas
  int _pessoas = 0;
  String _textoEstado = "Pode Entrar!";

  //Criando uma funcao para incrementar ou diminuir o numero de pessoas
  //e mudar o texto de estado na parte inferior
  void numeroPessoas(int delta){
    setState(() {
      _pessoas += delta;
    });

    if (_pessoas < 0){ //Se for menos que 0, mostrar uma mensagem de desaprovacao
      _textoEstado = "Qual foi doido";
    } else if(_pessoas <= 10){ //Se o numero de pessoas for entre 0 e 10, dizer que estamos livres
      _textoEstado = "Pode Entrar!";
    } else{ //Se maior que 10, dizer que estamos lotados
      _textoEstado = "Estamos Lotados :(";
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    //Criando um Stack para colocar uma imagem de fundo
    Stack( 
      children: <Widget>[
        //Declarando a imagem de fundo do espaco
        Image.asset(
          'assets/images/space.jpg', //Mostrando o diretorio
          fit: BoxFit.cover, //Dizendo que ela deve cobrir toda a tela
          height: 1000.0,
          width: 1000.0,
        ),
        //Criando uma coluna em que os elementos ficarao
        Column(
          //Definindo o alinhamento dos elementos como central 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Mostra o numero de pessoas atualmente
            Text(
              "Pessoas: $_pessoas",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            //Cria uma linha para os botoes de aumentar e diminuir
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Coloca Padding nos botoes para que tenham certa distancia dos outros elementos
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: 
                //Botao para adicionar
                FlatButton(
                  child: Text(
                    "+1",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                  onPressed: () {
                    numeroPessoas(1);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: 
                //Botao para diminuir
                FlatButton(
                  child: Text(
                    "-1",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                  onPressed: () {
                    numeroPessoas(-1);
                  },
                ),
              ),
            ]),
            //Texto que mostra o estado, se podemos entrar ou nao 
            //E alterado de acordo com o numero de pessoas contadas
            Text(
              _textoEstado,
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        ),
      ],
    );
  }
}
