import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'index_main_page.dart';

class BlogListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BlogListPageState();
  }
}

class _BlogListPageState extends State<BlogListPage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _favourSets = new Set<WordPair>();

  _BlogListPageState();

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random(); // 删除这两行
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _favourSets.contains(suggestion);
//    var pair = WordPair.random().asPascalCase;
    var pair = suggestion.asPascalCase;
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: Colors.blue),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _favourSets.remove(suggestion);
          } else {
            _favourSets.add(suggestion);
          }
          if(alreadySaved){
            _pushToBlogPage();
          }
        });
      },
    );
  }

  void _pushToBlogPage(){
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder:(context){
            return new IndexMainPage();
          }
      )
    );
  }


}
