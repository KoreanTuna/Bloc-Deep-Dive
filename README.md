

# Bloc-Deep-Dive
[영화진흥위원회 OpenAPI](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do)를 활용하여 만든 Bloc스터디 데모 프로젝트입니다.


# OnBoard 화면
<img width="330" alt="onboard" src="https://github.com/user-attachments/assets/bcb87d64-965d-4773-a4a3-f443958a1283" />
</br>
</br>
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

</br>
장르카드가 모두 선택되어, 하단에 선택 완료버튼을 클릭했을때, SubmitEvent가 Bloc에 추가되고,
Bloc리스너를 통해 이벤트 처리 진행

``` dart
    child: BlocListener<OnBoardBloc, OnBoardState>(
    listenWhen: (previous, current) {
      return previous.isSubmitted != current.isSubmitted;
    },
    
    /// OnBoardBloc의 isSubmitted 상태가 변경되었을 때만 실행
    listener: (context, state) {
      if (state.isSubmitted) {
        context.goNamed(RouterPath.home);
      }
    },
```

# DailyBoxOffice 화면

<img width="330px" alt="home" src="https://github.com/user-attachments/assets/7d44d403-ba39-4461-b008-933f6f654128" />

<br><br>

데이터를 Fetching해오는 Bloc함수
의존성주입받은 Repo를 통해 Result타입으로 결과 리턴 후 성공/실패에 따라 emit진행
성공의 경우 영화의 rank를 기준으로 정렬 후 emit을 진행한다.
``` dart
Future<void> _onFetched(
    DailyBoxOfficeFetched event,
    Emitter<DailyBoxOfficeState> emit,
  ) async {
    final Result<DailyBoxOfficeModel> result = await _boxOfficeRepository
        .getDailyBoxOffice(targetDt: event.targetDt, itemPerPage: '10');

    result.when(
      ok: (DailyBoxOfficeModel data) {
        final List<DailyBoxOfficeMovieModel> boxOffices = List.from(
          data.dailyBoxOfficeList,
        )..sort((a, b) => a.rank!.compareTo(b.rank!));

        emit(
          state.copyWith(
            status: DailyBoxOfficeStatus.success,
            boxOffices: boxOffices,
          ),
        );
      },
      error: (Exception e) {
        emit(state.copyWith(status: DailyBoxOfficeStatus.failure));
      },
    );
  }
```

# MovieDetail 화면
![화면 기록 2025-07-01 오후 6 48 22](https://github.com/user-attachments/assets/da8d9805-b6ce-4f58-a052-58276e1249af)
<br>
<br>

영화 상세 정보 API를 활용하여 영화의 개봉일, 제작사, 출연진, 장르와 같은 정보를 불러오는 화면입니다.
데일리박스오피스와 동일한 형식의 Bloc패턴이 사용되었으나 데이터 Caching을 위해 Data 레이어단의 Repo에 Cache용 변수를 생성하여 
동일한 영화코드의 요청이 들어온 경우 캐싱된 데이터를 리턴해주는 코드를 추가했습니다.
<br>

``` dart
 MovieDetailModel? _cachedMovieDetail;

  /// 영화 상세 정보 조회
  Future<Result<MovieDetailModel>> getMovieDetail({
    required String movieCd,
    bool forceRefresh = false,
  }) async {
    // 캐시된 데이터가 있고, 강제 새로고침이 필요하지 않으면 캐시된 데이터를 반환
    if (!forceRefresh &&
        _cachedMovieDetail != null &&
        _cachedMovieDetail!.movieInfo.movieCd == movieCd) {
      return Result.ok(_cachedMovieDetail!);
    }

    try {
      final MovieDetailResponseModel response = await _movieDetailDataSource
          .getMovieDetail(
            MovieDetailRequestModel(
              key: ApiConfig.apiKey,
              movieCd: movieCd,
            ),
          );
      _cachedMovieDetail = response.movieInfoResult;
      return Result.ok(response.movieInfoResult);
    } catch (e) {
      return Result.error(Exception('Failed to fetch movie details: $e'));
    }
  }
}
```





