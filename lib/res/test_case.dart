import 'package:meta/meta.dart';

///
class TestCase {
  ///
  const TestCase(this.args);

  ///
  final List args;
}

///
class TestCase1<A> {
  ///
  const TestCase1(this.arg);

  ///
  final A arg;
}

///

class TestCase2<A, B> {
  ///
  const TestCase2(this.arg1, this.arg2);

  ///
  final A arg1;

  ///
  final B arg2;
}

///
class TestCase3<A, B, C> {
  ///
  const TestCase3(this.arg1, this.arg2, this.arg3);

  ///
  final A arg1;

  ///
  final B arg2;

  ///
  final C arg3;
}

///
class TestCase4<A, B, C, D> {
  ///
  const TestCase4(this.arg1, this.arg2, this.arg3, this.arg4);

  ///
  final A arg1;

  ///
  final B arg2;

  ///
  final C arg3;

  ///
  final D arg4;
}

///
@isTestGroup
void testCases(
  List<TestCase> testCases,
  void Function(TestCase testCase) verify,
) {
  for (final testCase in testCases) {
    //
    verify(testCase);
  }
}

///
@isTestGroup
void testCases1<A>(
  List<TestCase1<A>> testCases,
  void Function(TestCase1<A> testCase) verify,
) {
  for (final testCase in testCases) {
    //
    verify(testCase);
  }
}

///
@isTestGroup
void testCases2<A, B>(
  List<TestCase2<A, B>> testCases,
  void Function(TestCase2<A, B> testCase) verify,
) {
  for (final testCase in testCases) {
    //
    verify(testCase);
  }
}

///
@isTestGroup
void testCases3<A, B, C>(
  List<TestCase3<A, B, C>> testCases,
  void Function(TestCase3<A, B, C> testCase) verify,
) {
  for (final testCase in testCases) {
    //
    verify(testCase);
  }
}

///
@isTestGroup
void testCases4<A, B, C, D>(
  List<TestCase4<A, B, C, D>> testCases,
  void Function(TestCase4<A, B, C, D> testCase) verify,
) {
  for (final testCase in testCases) {
    //
    verify(testCase);
  }
}
