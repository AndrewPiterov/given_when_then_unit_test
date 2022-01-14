import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  GivenWhenThenOptions.pads = 4;

  testCases([
    const TestCase([1, 1, 2]),
    const TestCase([5, 3, 8])
  ], (testCase) {
    final x = testCase.args[0] as int;
    final y = testCase.args[1] as int;

    given('two numbers $x and $y', () {
      //
      when('summarizing them', () {
        then('the result should be equal to ${testCase.args.last}', () {
          (x + y).should.be(testCase.args[2] as int);
        });
      });
    });
  });
}
