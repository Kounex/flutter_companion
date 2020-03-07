import 'package:basic_layout/types/medium_type.dart';

/// Dart does not have a dedicated syntax for interfaces. Classes can implement other
/// classes and not specifically interfaces. We can still define an abstract class which has
/// properties and functions (which have no default implementation) which can be used and
/// need to be overriden in order to use.
abstract class Medium {
  String name;
  String publisher;
  MediumType type;

  String getFullMediumText();
}
