/// This represents a model which is used in this project. Models are classes
/// (in runtime objects) which represents entities like users, companies, games etc.
/// Usually they wrap data from different sources like HTTP requests, JSONs, databases
///
/// Depending on the scale of a project it could also be possible to split this models
/// folder into features. If for example only a subtree of the app uses certain models
/// you could create models folder inside those views (just like widgets folder in views
/// right now)
class Game {
  /// How the game is called - literally the 'name' of the game...
  String name;
  String publisher;
  String developmentTeam;
  int releaseDateMS;

  Game(
    this.name,
    this.publisher,
    this.developmentTeam,
    this.releaseDateMS,
  );

  @override
  String toString() =>
      '${this.name} as published by ${this.publisher} was developed by ${this.developmentTeam} and released ${new DateTime.fromMillisecondsSinceEpoch(this.releaseDateMS).toString()}';
}
