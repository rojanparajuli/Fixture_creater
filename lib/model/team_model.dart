

class TeamModel {
String? teamname;

  TeamModel({this.teamname});
}

class FixtureModel{
int? win;
int? loss;
int ?draw;
int ? points;
int ? matchedPlayed;
int? goals;
String? vs;

FixtureModel({this.win, this.loss, this.draw, this.goals, this.matchedPlayed, this.points, this.vs});
}
