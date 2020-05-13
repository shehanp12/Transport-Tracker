import 'package:flutter/material.dart';


/// This Widget is the main application widget.
class DevelopedBy extends StatelessWidget {
  static const String _title = 'Developed By';
  static const String id = 'Developed_By';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Card(
                
                child: new Container(
                  padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal:16.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Chamodya Dias',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                      ),
                      new Text('Software Engineer'),
                      new Text('Sysco Labs'),
                      new Text('Mentor')
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Shehan Prasanna',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                      ),
                      new Text('Developer'),

                    ],
                  ),
                ),
              ),
             new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Binura Owin',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                      ),
                      new Text('Developer')
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Anjana Lakshan',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                      ),
                      new Text('Ui Ux Designer')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
 );
  }
}

