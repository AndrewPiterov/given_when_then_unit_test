import 'package:given_when_then_unit_test/res/given.dart';
import 'package:given_when_then_unit_test/res/then.dart';
import 'package:given_when_then_unit_test/res/when.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given(
    'fail test #1',
    () {
      when('do something', () {
        then('should fail', () {
          0.should.beNegative();
        });
      });
    },
    skip: 'Skip for testing #1',
  );

  given(
    'fail test #2',
    () {
      when(
        'do something',
        () {
          then('should fail', () {
            0.should.beNegative();
          });
        },
        skip: 'Skip for testing #2',
      );
    },
  );

  given(
    'fail test #3',
    () {
      when(
        'do something',
        () {
          then(
            'should fail',
            () {
              0.should.beNegative();
            },
            skip: 'Skip for testing #3',
          );
        },
      );
    },
  );
}
