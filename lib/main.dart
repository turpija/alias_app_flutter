import 'package:flutter/material.dart';
import './team_widget.dart';

final imeTima = TextEditingController();
final igrac1 = TextEditingController();
final igrac2 = TextEditingController();

final imeTimaFormKey = GlobalKey<FormState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[850],
      ),
      home: AliasApp(),
    );
  }
}

class AliasApp extends StatefulWidget {
  @override
  AliasAppState createState() => AliasAppState();
}

class AliasAppState extends State<AliasApp> {
  final double _iconSize = 35.0;
  final List<dynamic> timovi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('aliasApp'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('opcije'),
                Icon(Icons.list, size: _iconSize),
              ],
            ),
            onPressed: () {
              print('opcije');
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(),

          //   InsertTeamWidget(
          //       'žuće', 'Anastazija', 'Kassandra', Colors.yellow[900], _iconSize),
          //   InsertTeamWidget(
          //       'timPlaviJebači', 'Pero', 'Djuro', Colors.teal[800], _iconSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[_addTeamBtn()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_startBtn()],
          ),
        ],
      ),
    );
  }

  Widget _addTeamBtn() {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('dodaj tim'),
          Icon(Icons.add_circle, size: _iconSize),
        ],
      ),
      onPressed: () {
        print('dodajTim');

        _showDialog(context);

        // List tim = ['jebivjetri', 'djuro', 'djoka', 0];
        // timovi.add(tim);
        // print(timovi);
      },
    );
  }

  Widget _startBtn() {
    // final double _iconSize = iconSize;

    return FlatButton(
      child: Row(
        children: <Widget>[
          Text('start'),
          Icon(Icons.play_circle_filled, size: _iconSize)
        ],
      ),
      onPressed: () {
        print('startaj igru');
        if (timovi.length >= 2) {
          print('pokreni');
        } else {
          print('trebaš barem dva tima');
        }
      },
    );
  }
}

Function RemoveTeam() {
  print('are you sure?');
  print('briši jebote');
}

void _showDialog(BuildContext context) {
  final FocusNode _imeTimaFocus = FocusNode();
  final FocusNode _igrac1Focus = FocusNode();
  final FocusNode _igrac2Focus = FocusNode();

  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text('Upiši novi tim'),
        content: Form(
          key: imeTimaFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'ime tima',
                ),
                controller: imeTima,
                textInputAction: TextInputAction.next,
                autofocus: true,
                focusNode: _imeTimaFocus,
                validator: (val) =>
                    val.isEmpty ? 'upiši ime tima jebote' : null,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'upiši ime tima';
                //   }
                // },
                onFieldSubmitted: (String value) {
                  FocusScope.of(context).requestFocus(_igrac1Focus);
                },
              ),
              TextFormField(
                onEditingComplete: () {},
                textInputAction: TextInputAction.next,
                focusNode: _igrac1Focus,
                validator: (val) =>
                    val.isEmpty ? 'prvi igrač mora imat ime' : null,
                onFieldSubmitted: (String value) {
                  FocusScope.of(context).requestFocus(_igrac2Focus);
                },
                decoration: InputDecoration(
                  hintText: 'igrač prvi',
                ),
                controller: igrac1,
              ),
              TextFormField(
                onEditingComplete: () {},
                textInputAction: TextInputAction.done,
                focusNode: _igrac2Focus,
                validator: (val) =>
                    val.isEmpty ? 'drugi igrač mora imat ime' : null,
                onFieldSubmitted: (String value) {
                  _handleSubmitted(context);
                },
                decoration: InputDecoration(
                  hintText: 'igrač drugi',
                ),
                controller: igrac2,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _handleSubmitted(BuildContext context) {
  if (imeTimaFormKey.currentState.validate()) {
    print('woohoo');
    Navigator.of(context).pop();
  }

  // imeTima.clear();
  // igrac1.clear();
  // igrac2.clear();
}
