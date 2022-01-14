import 'package:meta/meta.dart';

///
class TestCase {
  ///
  const TestCase(this.args);

  ///
  final List args;
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
