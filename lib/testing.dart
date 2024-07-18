import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String paragraph =
      "Review My Personal Improvement Project. This project aims to improve personal skills and performance.";
  String searchWord = "project";
  int foundCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highlight Search Word'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
              ),
              onChanged: (value) {
                setState(() {
                  searchWord = value;
                  foundCount = countOccurrences(paragraph, searchWord);
                });
              },
            ),
            SizedBox(height: 20),
            Text('Found: $foundCount'),
            SizedBox(height: 20),
            RichText(
              text: buildHighlightedText(paragraph, searchWord),
            ),
          ],
        ),
      ),
    );
  }

  int countOccurrences(String text, String searchWord) {
    if (searchWord.isEmpty) {
      return 0;
    }
    int count = 0;
    int start = 0;
    int index;
    while ((index =
            text.toLowerCase().indexOf(searchWord.toLowerCase(), start)) !=
        -1) {
      count++;
      start = index + searchWord.length;
    }
    return count;
  }

  TextSpan buildHighlightedText(String text, String searchWord) {
    if (searchWord.isEmpty) {
      return TextSpan(text: text, style: TextStyle(color: Colors.black));
    }

    List<TextSpan> spans = [];
    int start = 0;
    int index;

    while ((index =
            text.toLowerCase().indexOf(searchWord.toLowerCase(), start)) !=
        -1) {
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }
      spans.add(TextSpan(
        text: text.substring(index, index + searchWord.length),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.yellow, // Highlight background color
        ),
      ));
      start = index + searchWord.length;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return TextSpan(children: spans, style: TextStyle(color: Colors.black));
  }
}
