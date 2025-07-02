

# Bloc-Deep-Dive
[영화진흥위원회 OpenAPI](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do)를 활용하여 만든 Bloc스터디 데모 프로젝트입니다.

# 주요 사용 라이브러리

  [flutter_bloc](https://pub.dev/packages/flutter_bloc)
  [equatable](https://pub.dev/packages/equatable)
  <br>
  [dio](https://pub.dev/packages/dio)
  [retrofit](https://pub.dev/packages/retrofit)
  <br>
  
  [flutter_hooks](https://pub.dev/packages/flutter_hooks)
  [freezed](https://pub.dev/packages/freezed)
  <br>
  [get_it](https://pub.dev/packages/get_it) [injectable](https://pub.dev/packages/injectable)<br>
  [go_router](https://pub.dev/packages/go_router)
  
  
# Login 화면
<img width="330" alt="login" src="https://github.com/user-attachments/assets/2c85b0ba-6f86-495e-bf3f-54444905a40a" /><br>
로그인 과정을 담당하는 LoginBloc과 사용자 정보를 담당하는 UserBloc간 의존성 관계가 생기지 않도록<br>
각 Bloc의 BlocListener를 중첩하여 Login Event가 성공했을때, UserEvent를 발생시키도록 배치.
<br>

``` dart
 return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  '로그인에 실패했습니다.',
                  style: TextStyle().body2.copyWith(color: ColorStyle.white),
                ),
              ),
            );
        }

        if (state.status.isSuccess) {
          context.read<UserBloc>().add(
            UserDataRequested(userId: state.user.id),
          );
        }
      },
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    '사용자 정보를 가져오는 데 실패했습니다.',
                    style: TextStyle().body2.copyWith(color: ColorStyle.white),
                  ),
                ),
              );
            return;
          }

          /// 사용자 정보 불러오기 성공
          context.goNamed(RouterPath.splash);
        },
```


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
<img width="330px" alt="home" src="https://github.com/user-attachments/assets/2ec9c8ae-edca-4803-8a01-f73503be730a" />

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





