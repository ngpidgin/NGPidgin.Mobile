import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class ContentSection extends StatelessWidget {
  final SentenceModel model;
  ContentSection(this.model);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.titleSmall!;

    return Container(
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(25, 25, 17, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sentence", style: titleStyle),
                SizedBox(height: 5),
                SelectableText(model.sentence, style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Translations", style: titleStyle),
                      Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(0),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              highlightColor: Colors.transparent,
                              child: Icon(Icons.copy_outlined,
                                  size: 20, color: Palette.LightGray),
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: stripHtml(model.translations)));
                              }),
                        ),
                      )
                    ]),
                SizedBox(height: 5),
                Container(
                  transform: Matrix4.translationValues(-8, 0, 0),
                  child: HtmlWidget(
                    model.translations,
                    textStyle: TextStyle(
                      fontSize: 15, // Set the font size for the entire content
                      height:
                          1.5, // Equivalent to line height in `flutter_html`
                    ),
                    customStylesBuilder: (element) {
                      if (element.localName == 'li') {
                        return {
                          'padding-left': '0px'
                        }; // Remove left padding for list items
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                    "Category: ${SentenceModel.getCategoryDesc(sentenceCategory.values[model.category])}",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Palette.Pale))
              ],
            ),
          )
        ],
      ),
    );
  }
}
