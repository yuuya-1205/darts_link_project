enum GeneralTagType {
  orthodoxDarts,

  friendWanted,
  other;

  String get label {
    switch (this) {
      case GeneralTagType.orthodoxDarts:
        return 'ガチダーツ';
      case GeneralTagType.friendWanted:
        return '友達募集';
      case GeneralTagType.other:
        return '';
    }
  }

  factory GeneralTagType.fromLabel(String label) {
    switch (label) {
      case 'ガチダーツ':
        return GeneralTagType.orthodoxDarts;
      case '友達募集':
        return GeneralTagType.friendWanted;
    }
    return GeneralTagType.other;
  }
}

enum PersonTagType {
  onlyMale,
  onlyFemale,
}

extension PersonTagTypeExtensoin on PersonTagType {
  String? get label {
    switch (this) {
      case PersonTagType.onlyMale:
        return '男性限定';
      case PersonTagType.onlyFemale:
        return '女性限定';
    }
  }
}

enum FeatureTagType {
  onlyMale,
  orthodoxDarts,
  friendWanted,
  other;

  String get label {
    switch (this) {
      case FeatureTagType.onlyMale:
        return '男性限定';
      case FeatureTagType.orthodoxDarts:
        return 'ガチダーツ';
      case FeatureTagType.friendWanted:
        return '友達募集';
      case FeatureTagType.other:
        return 'その他';
    }
  }

  factory FeatureTagType.fromLabel(String label) {
    switch (label) {
      case '男性限定':
        return FeatureTagType.onlyMale;
      case '友達募集':
        return FeatureTagType.friendWanted;
    }
    return FeatureTagType.other;
  }
}

enum DartsModelTagType {
  dartsLive,
  phoenix,
  other;

  String get label {
    switch (this) {
      case DartsModelTagType.dartsLive:
        return 'ダーツライブ';
      case DartsModelTagType.phoenix:
        return 'フェニックス';
      case DartsModelTagType.other:
        return 'その他';
    }
  }

  factory DartsModelTagType.fromLabel(String label) {
    switch (label) {
      case 'ダーツライブ':
        return DartsModelTagType.dartsLive;
      case 'フェニックス':
        return DartsModelTagType.phoenix;
      case 'その他':
        return DartsModelTagType.other;
    }
    return DartsModelTagType.other;
  }
}
