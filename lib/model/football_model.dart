class TeamModel {
  String? teamname;

  TeamModel({this.teamname});
}

class FixtureModel {
  int? win;
  int? loss;
  int? draw;
  int? points;
  int? matchedPlayed;
  int? goals;
  String? vs;
  int? team1Score;
  int? team2Score;

  FixtureModel({
    this.win,
    this.loss,
    this.draw,
    this.goals,
    this.matchedPlayed,
    this.points,
    this.vs,
    this.team1Score,
    this.team2Score,
  });
}








