enum FavoriteGenre {
  action,
  comedy,
  drama,
  horror,
  romance,
  sciFi,
  thriller,
  fantasy,
  animation,
  documentary,
  mystery,
  adventure,
  crime,
  historical,
  musical,
  western,
  war,
  family,
  sports;

  String get korean {
    switch (this) {
      case FavoriteGenre.action:
        return '액션';
      case FavoriteGenre.comedy:
        return '코미디';
      case FavoriteGenre.drama:
        return '드라마';
      case FavoriteGenre.horror:
        return '공포';
      case FavoriteGenre.romance:
        return '로맨스';
      case FavoriteGenre.sciFi:
        return 'SF';
      case FavoriteGenre.thriller:
        return '스릴러';
      case FavoriteGenre.fantasy:
        return '판타지';
      case FavoriteGenre.animation:
        return '애니메이션';
      case FavoriteGenre.documentary:
        return '다큐멘터리';
      case FavoriteGenre.mystery:
        return '미스터리';
      case FavoriteGenre.adventure:
        return '모험';
      case FavoriteGenre.crime:
        return '범죄';
      case FavoriteGenre.historical:
        return '역사';
      case FavoriteGenre.musical:
        return '뮤지컬';
      case FavoriteGenre.western:
        return '서부';
      case FavoriteGenre.war:
        return '전쟁';
      case FavoriteGenre.family:
        return '가족';
      case FavoriteGenre.sports:
        return '스포츠';
    }
  }
}
