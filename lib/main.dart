import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      //final wordPair = WordPair.random();
      return MaterialApp(
        title :"Hellow Flutter",
        home : RandomWords()
        /*home : Scaffold(appBar: AppBar(
          title: Text('Hello'),
        ),
          body:Center(
          //child: Text(wordPair.asCamelCase),
            child:RandomWords(),
          ),
        ),*/
      );
  }
}

class RandomWordState extends State<RandomWords>{

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 20.0);

  Widget buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if ( i.isOdd) return Divider();
        final index  = i ~/2;
        if(index >=  _suggestions.length){

          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);

      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter'),
      ),
      body : buildSuggestions()
    );
    return Text(wordPair.asCamelCase);
  }

  Widget _buildRow(WordPair suggestion){
    return ListTile(
      title : Text(
        suggestion.asCamelCase,
        style : _biggerFont
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => new RandomWordState();
}
