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
