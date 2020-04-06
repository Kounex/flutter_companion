import 'package:flutter/material.dart';

class PreparedContainer extends StatelessWidget {
  final double currentWidth;
  final double currentHeight;
  final double maxHeight;
  final Color color;
  final BoxShape shape;
  final double borderRadius;
  final List<BoxShadow> shadow;

  PreparedContainer(
      {@required this.currentWidth,
      @required this.currentHeight,
      @required this.maxHeight,
      @required this.color,
      @required this.shape,
      @required this.borderRadius,
      @required this.shadow});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight,

      /// Using Align because the Container is inside
      /// a ListView and will therefore be "stretched"
      /// horizontally on default - Align does counter
      /// this behaviour
      child: Align(
        /// The actual container widget we are manipulating here
        /// and is shown s the first item in this view. All the upcoming
        /// widgets are used to change the values of the properties
        /// of this container
        child: Container(
          height: this.currentHeight,
          width: this.currentWidth,
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: this.shape == BoxShape.rectangle
                ? BorderRadius.all(
                    Radius.circular(this.borderRadius),
                  )
                : null,
            shape: this.shape,
            boxShadow: this.shadow,
          ),
        ),
      ),
    );
  }
}
