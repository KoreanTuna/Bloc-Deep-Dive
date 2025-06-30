

# Bloc-Deep-Dive
[영화진흥위원회 OpenAPI](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do)를 활용하여 만든 Bloc스터디 데모 프로젝트입니다.


# OnBoard 화면
<img width="330" alt="onboard" src="https://github.com/user-attachments/assets/8f79abc7-1e6e-409b-b1de-eebd7514be8e" />

OnBoardEvent : Select / DeSelect / Submit 3가지 이벤트 클래스 사용 </br>
OnBoardState : FavoriteGenre Enum 리스트를 상태로 갖는다.
</br>

장르카드는 BlocSelector를 통해 현재 선택되어있는지 아닌에 따라 Select, DeSelect Event를 분기처리
[코드 파일](https://github.com/KoreanTuna/Bloc-Deep-Dive/blob/main/lib/presentation/on_board/presentation/on_board_screen.dart)
``` dart
return BlocSelector<OnBoardBloc, OnBoardState, bool>(
    selector: (state) => state.selectedGenres.contains(genre),
    builder: (context, isSelected) {
      return GenreCard(
        onTap: (_) {
          if (isSelected) {
            context.read<OnBoardBloc>().add(
              DeselectGenreEvent(genre),
            );
          } else {
            context.read<OnBoardBloc>().add(
              SelectGenreEvent(genre),
            );
          }
        },
        genre: genre,
        isSelected: isSelected,
      );
    },
  );
```



# DailyBoxOffice 화면

<img width="330px" alt="home" src="https://github.com/user-attachments/assets/7d44d403-ba39-4461-b008-933f6f654128" />
