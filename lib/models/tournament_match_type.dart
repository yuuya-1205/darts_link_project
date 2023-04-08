enum TournamentMatchType {
  single('シングルス'),
  double('ダブルス'),
  trio('トリオス'),
  galon('ガロン');

  const TournamentMatchType(this.title);
  final String title;
}
