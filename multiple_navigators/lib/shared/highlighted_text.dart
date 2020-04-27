import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final List<String> keywords;

  HighlightedText({@required this.text, this.keywords});

  List<String> _keywordSplitter(List<String> texts, String keyword) {
    List<String> result = [];
    texts.forEach((snippets) {
      List<String> splitted = snippets.split(keyword);
      if (splitted.length > 1) {
        splitted.forEach((t) => result.addAll([t, keyword]));
        result = result.sublist(0, result.length - 1);
      } else {
        result.add(snippets);
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<String> result = [this.text];
    keywords.forEach((keyword) => result = _keywordSplitter(result, keyword));
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: result
            .map((textPart) => keywords.contains(textPart)
                ? TextSpan(
                    text: '$textPart',
                    style: TextStyle(color: Theme.of(context).highlightColor))
                : TextSpan(text: textPart))
            .toList(),
      ),
    );
  }
}
