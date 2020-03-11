import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetStateView extends StatefulWidget {
  @override
  _SetStateViewState createState() => _SetStateViewState();
}

class _SetStateViewState extends State<SetStateView> {
  bool _secondImage = false;
  Widget _imageWidget = Image.asset(
    'assets/images/set-state-icon_2.png',
    key: Key('1'),
  );

  void _toggleImage() {
    setState(() {
      if (_secondImage) {
        _imageWidget = Image.asset(
          'assets/images/set-state-icon_2.png',
          key: Key('1'),
        );
      } else {
        _imageWidget = Image.asset(
          'assets/images/set-state-icon.png',
          key: Key('2'),
        );
      }
      _secondImage = !_secondImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'State Management',
        middle: Text('setState'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(top: 24.0),
                height: 150.0,
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'assets/images/set-state-icon_2.png',
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity:
                              Tween(begin: -0.5, end: 1.0).animate(animation),
                          child: animation.value == 1.0
                              ? SlideTransition(
                                  position: CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeInOut)
                                      .drive(
                                    Tween(
                                      begin: Offset(1.0, 0.0),
                                      end: Offset(0.0, 0.0),
                                    ),
                                  ),
                                  child: child,
                                )
                              : SlideTransition(
                                  position: CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeInOut)
                                      .drive(
                                    Tween(
                                      begin: Offset(-1.0, 0.0),
                                      end: Offset(0.0, 0.0),
                                    ),
                                  ),
                                  child: child,
                                ),
                        );
                      },
                      child: _imageWidget),
                ),
              ),
              Card(
                margin: EdgeInsets.all(24.0),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Überblick',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          CupertinoButton(
                            child: Text('Switch'),
                            onPressed: () => _toggleImage(),
                          )
                        ],
                      ),
                      Divider(),
                      Text(
                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.')
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
