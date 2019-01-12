import 'package:flutter/material.dart';

class TeamWidget extends StatefulWidget {
  final String teamName;
  final String igracPrvi;
  final String igracDrugi;
  final Color teamColor;
  final double iconSize;

  TeamWidget(this.teamName, this.igracPrvi, this.igracDrugi,
      this.teamColor, this.iconSize);

  @override
 // _TeamWidgetState createState() => _TeamWidgetState();
   State<StatefulWidget> createState() {
     return _TeamWidgetState();
  }
}

class _TeamWidgetState extends State<TeamWidget> {
   String teamName;
   String igracPrvi;
   String igracDrugi;
  Color teamColor;
   double paddingAmount = 10.0;
  final teamFont = const TextStyle(fontSize: 18);
  final igracFont = const TextStyle(fontSize: 16);
   double iconSize;  
  @override
    void initState() {
      teamName = widget.teamName;
      igracPrvi = widget.igracPrvi;
      igracDrugi = widget.igracDrugi; 
      teamColor = widget.teamColor; 
      iconSize = widget.iconSize;
      super.initState();
    }
  
  @override
  Widget build(BuildContext context) {
    return Card(
        color: this.teamColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(paddingAmount),
                      child: Text(teamName, style: teamFont),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: paddingAmount, bottom: paddingAmount),
                      child: Text(igracPrvi, style: igracFont),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: paddingAmount),
                      child: Text(igracDrugi, style: igracFont),
                    ),
                  ],
                ),
              ],
            )),
            Align(
              //alignment: Alignment.centerRight,
              child: Container(
                  width: 60,
                  child: FlatButton(
                    padding: EdgeInsets.only(right: paddingAmount),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.remove_circle, size: iconSize),
                        Text('del'),
                      ],
                    ),
                    onPressed: () {
                      print('obriši ovaj tim');
                    },
                  )),
            ),
          ],
        ));

/*
    return Card(
      color: _teamColor,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(paddingAmount),
                  child: Text(teamName, style: teamFont),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(paddingAmount),
                    child: Text(igracPrvi, style: igracFont),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: paddingAmount),
                    child: Text(igracDrugi, style: igracFont),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 50,
                    child: FlatButton(
                      padding: EdgeInsets.only(right: paddingAmount),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.delete),
                          Text('del'),
                        ],
                      ),
                      onPressed: () {
                        print('obriši');
                      },
                    )),
              )
            ],
          )),
        ],
      ),
    );

    */
  }
}
