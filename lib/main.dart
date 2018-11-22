import 'package:flutter/material.dart';

void main() {
  runApp(new PerlDocApp());
}

// UI built with help from
// https://codelabs.developers.google.com/codelabs/flutter/index.html#3

class PerlDocApp extends StatelessWidget {
  @override // This is to overide the build() method of a StatelessWidget
  Widget build( BuildContext context) {
    return new MaterialApp(
      title: "PerlDoc",
      home: new PerlDocScreen(),
    );
  }

}

class PerlDocScreen extends StatefulWidget {
  @override
  State createState() => new SearchScreenState();
}

class SearchScreenState extends State<PerlDocScreen> {
  final TextEditingController _textController = new TextEditingController();

  Widget _buildModuleTextSearch(){
    return new IconTheme(
      data: new IconThemeData( color:Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child:  new Row(
          children: <Widget> [
            new Flexible(
              child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                hintText: "Search a Module"),
              ),
          ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal:4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ]
        ),
      )
    );
  }

  void _handleSubmitted(String text){
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("PerlDoc")),
      body: _buildModuleTextSearch()
    );
  }

}
