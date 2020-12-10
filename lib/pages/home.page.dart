import 'package:flutter/material.dart';
import 'package:empreendeuna/pages/video.page.dart';
import 'package:empreendeuna/pages/consultores.page.dart';
import 'package:empreendeuna/pages/avaliacao.page.dart';

class HomePage extends StatelessWidget {
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
            homeButtonItem(
                "Cursos",
                "assets/video.png",
                () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPage(),
                          ))
                    }),
            homeButtonItem(
                "Consultores",
                "assets/consultores.png",
                () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConsultoresPage(),
                          ))
                    }),
            homeButtonItem(
                "Avalie o Conteúdo",
                "assets/avaliacao.png",
                () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvaliacaoPage(),
                          ))
                    }),
          ],
        ),
      ),
    );
  }
}

Widget homeButtonItem(String _texto, String icone, Function onClickAction) {
  return Container(
    height: 60,
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3, 1],
        colors: [
          Color(0xFFF58524),
          Color(0XFFF92B7F),
        ],
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: SizedBox.expand(
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _texto,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              child: SizedBox(
                child: Image.asset(icone),
                height: 28,
                width: 28,
              ),
            )
          ],
        ),
        onPressed: () {
          onClickAction();
        },
      ),
    ),
  );
}
