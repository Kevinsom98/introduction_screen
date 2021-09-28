import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroContent extends StatelessWidget {
  final PageViewModel page;
  final bool isFullScreen;

  const IntroContent({Key? key, required this.page, this.isFullScreen = false})
      : super(key: key);

  Widget _buildWidget(Widget? widget, String? text, TextStyle style) {
    return widget ?? Text(text!, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: page.decoration.contentMargin,
    //   decoration: isFullScreen
    //       ? page.decoration.boxDecoration ??
    //           BoxDecoration(
    //             color: page.decoration.pageColor,
    //             borderRadius: BorderRadius.circular(8.0),
    //           )
    //       : null,

    return Container(
      child: Stack(
        children: <Widget>[
          //image code
          Image.network(
            'https://guyanatourism.com/wp-content/uploads/2019/07/Lethem-trail-scaled.jpg',
          ),
          //gradient
          Container(
            // height: 50,
            width: double.infinity,
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black38,
                  Colors.black26,
                  // Colors.indigo,
                ],
              ),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: page.decoration.titlePadding,
                child: _buildWidget(
                  page.titleWidget,
                  page.title,
                  page.decoration.titleTextStyle,
                ),
              ),
              Padding(
                padding: page.decoration.descriptionPadding,
                child: _buildWidget(
                  page.bodyWidget,
                  page.body,
                  page.decoration.bodyTextStyle,
                ),
              ),
              if (page.footer != null)
                Padding(
                  padding: page.decoration.footerPadding,
                  child: page.footer,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
