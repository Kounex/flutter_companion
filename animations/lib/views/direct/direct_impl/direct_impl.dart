import 'dart:math';

import 'package:animations/shared/highlighted_text.dart';
import 'package:animations/shared/info_card.dart';
import 'package:flutter/material.dart';

class DirectImplView extends StatefulWidget {
  @override
  _DirectImplViewState createState() => _DirectImplViewState();
}

class _DirectImplViewState extends State<DirectImplView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _opacity1;
  Animation<double> _opacity2;
  Animation<double> _opacity3;
  Animation<double> _opacity4;
  Animation<double> _opacity5;

  Animation<double> _iconProgress;
  Animation<double> _rotation;

  Animation<Offset> _offset;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    _opacity1 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: (Interval(0.05, 0.15))));
    _opacity2 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: (Interval(0.23, 0.33))));
    _opacity3 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: (Interval(0.41, 0.51))));
    _opacity4 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: (Interval(0.59, 0.66))));
    _opacity5 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: (Interval(0.76, 0.84))));

    _iconProgress = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: (Interval(0.84, 1.0))));
    _rotation = Tween<double>(begin: 0.0, end: 0.25).animate(CurvedAnimation(
        parent: _controller,
        curve: (Interval(0.84, 1.0, curve: Curves.bounceInOut))));

    _offset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.5, 0.0))
        .animate(CurvedAnimation(
            parent: _controller, curve: (Interval(0.05, 0.15))));
    // _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Implementation'),
            actions: [
              Transform.translate(
                offset: Offset(10.0, 10.0),
                child: IconButton(
                  icon: Icon(Icons.title),
                  onPressed: () {
                    if (_controller.isAnimating) {
                      _controller.stop();
                    } else {
                      _controller.forward();
                    }
                  },
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                AnimatedBuilder(
                  child: InfoCard(
                    title: 'Oh boy!',
                    text:
                        'So we basically set up some nice Intervals so the Widgets fade in sequentially - nice huh?',
                  ),
                  animation: _controller,
                  builder: (context, child) => Column(
                    children: [
                      FadeTransition(
                        opacity: _opacity1,
                        child: SlideTransition(position: _offset, child: child),
                      ),
                      FadeTransition(
                        opacity: _opacity2,
                        child: InfoCard(
                            child: HighlightedText(
                          text:
                              'The AnimationController basically changes its internal "counter" from a beginning value (usually 0.0) to an end value (usually 1.0). While doing so, Animations which listen to the AnimationController - for example with animate(controller) - will update their animated value according to the "tick" of the AnimationController',
                          keywords: [
                            'AnimationController',
                            'animate(controller)'
                          ],
                        )),
                      ),
                      FadeTransition(
                        opacity: _opacity3,
                        child: InfoCard(
                          child: HighlightedText(
                            text:
                                'So whats left is that we update the UI according to the changing Animation value so we can actually see whats happening under the hood. We could make use of setState((){}) to update the UI every time the animation value changes, but rebuilding the whole Widget for that seems... expensive!',
                            keywords: ['setState((){})'],
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _opacity4,
                        child: InfoCard(
                          child: HighlightedText(
                            text:
                                'Thats where we use AnimationBuilder. It will only rebuild whats inside the builder function and is way more efficient by itself!',
                            keywords: ['AnimationBuilder', 'builder'],
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _opacity5,
                        child: InfoCard(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Here you have some very unnecessary animted Widget',
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: RotationTransition(
                                  turns: _rotation,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    width: 50.0,
                                    color: Colors.green,
                                    child: AnimatedIcon(
                                      icon: AnimatedIcons.event_add,
                                      progress: _iconProgress,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
