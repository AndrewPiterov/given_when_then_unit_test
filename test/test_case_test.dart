import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';
import 'package:test/scaffolding.dart';

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

  testCases2<String, String>([
    const TestCase2('Flutter', 'F'),
    const TestCase2('Awesome', 'A'),
  ], (args) {
    test('Word ${args.arg1} start with ${args.arg2}', () {
      args.arg1.should.startWith(args.arg2);
    });
  });

  testCases3<num, num, num>([
    const TestCase3(1, 1, 2),
    const TestCase3(5, 3, 8.0),
  ], (args) {
    given('two numbers ${args.arg1} and ${args.arg2}', () {
      //
      when('summarizing them', () {
        then('the result should be equal to ${args.arg3}', () {
          (args.arg1 + args.arg2).should.be(args.arg3);
        });
      });
    });
  });
}
