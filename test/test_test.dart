import 'package:flutter_test/flutter_test.dart';

void main() {
  /// 테스트 그룹
  group('Test', () {
    /// 테스트 케이스
    test('초기 상태는 0이어야 한다', () {
      // 초기 상태를 검증하는 코드
      expect(0, equals(0));
    });

    /// 또 다른 테스트 케이스
    test('1을 더하면 1이 되어야 한다', () {
      // 상태 변경 후 검증하는 코드
      expect(1, equals(1));
    });
  });
}
