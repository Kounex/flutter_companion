import 'package:flutter/material.dart';
import 'package:basic_layout/utils/list_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeBlock extends StatelessWidget {
  final List<RichText> children;
  final List<int> intentPerChild;
  final double baseIntent;
  final double intentMultiplier;
  final String title;
  final Color headerColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;

  CodeBlock(
      {@required this.children,
      this.intentPerChild,
      this.baseIntent = 14.0,
      this.intentMultiplier = 18.0,
      this.title,
      this.headerColor,
      this.backgroundColor,
      this.margin})
      : assert(
            intentPerChild != null && intentPerChild.length == children.length);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin ?? EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color:
            this.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: this.headerColor ?? Colors.black38,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 13.0,
                      width: 13.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 96, 92, 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.0),
                      height: 13.0,
                      width: 13.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 189, 68, 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.0),
                      height: 13.0,
                      width: 13.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 202, 78, 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(child: Text(this.title ?? '')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ...this.children.mapIndexed(
                          (line, index) => Text(
                            (index + 1).toString(),
                            style: GoogleFonts.sourceCodePro(),
                          ),
                        ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 6.0),
                    height: this.children.length * 16.0,
                    width: 1.0,
                    color: Colors.white),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...this.children.mapIndexed(
                          (line, index) => Padding(
                            padding: EdgeInsets.only(
                                left: this.baseIntent +
                                    this.intentPerChild[index] *
                                        this.intentMultiplier),
                            child: RichText(
                              text: TextSpan(
                                  style: GoogleFonts.sourceCodePro(),
                                  children: (line.text as TextSpan).children),
                            ),
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
