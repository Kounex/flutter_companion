import 'dart:math';

import 'package:flutter/material.dart';

const Duration kAnimationDuration = Duration(milliseconds: 1000);

class ImplicitImplView extends StatefulWidget {
  @override
  _ImplicitImplViewState createState() => _ImplicitImplViewState();
}

class _ImplicitImplViewState extends State<ImplicitImplView> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Implementation'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: Align(
                              child: AnimatedContainer(
                                duration: kAnimationDuration,
                                height: _selected ? 100.0 : 75.0,
                                width: _selected ? 100.0 : 75.0,
                                transform: _selected
                                    ? Matrix4.identity()
                                    : (Matrix4.identity()
                                      ..rotateY(pi)
                                      ..translate(-75.0, 0.0)),
                                decoration: BoxDecoration(
                                  color: _selected
                                      ? Colors.deepPurple
                                      : Colors.red,
                                ),
                                child: Icon(Icons.laptop_mac),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: AnimatedSwitcher(
                              duration: kAnimationDuration,
                              child: _selected
                                  ? Text(
                                      'Selected!',
                                      key: Key('1'),
                                    )
                                  : Text(
                                      'Not selected!',
                                      key: Key('2'),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Checkbox(
                          value: _selected,
                          onChanged: (selected) =>
                              setState(() => _selected = selected),
                        ),
                      ),
                      AnimatedPadding(
                        duration: kAnimationDuration,
                        padding: _selected
                            ? EdgeInsets.only(bottom: 24.0)
                            : EdgeInsets.only(bottom: 0.0),
                        child: AnimatedOpacity(
                          duration: kAnimationDuration,
                          opacity: _selected ? 1.0 : 0.0,
                          child: Text('(on)'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
