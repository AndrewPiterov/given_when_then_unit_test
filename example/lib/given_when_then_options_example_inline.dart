import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  // GivenWhenThenOptions.pads = 4;
  given('one thing', () {
    //
    and('another thing', () {
      //
      and('yet another thing', () {
        //
        when('I open my eyes', () {
          //
          then(
            'I see something',
            () {
              true.should.beTrue();
            },
            and: {
              'I see something else': () {
                true.should.not.beFalse();
              }
            },
            but: {
              'I do not see something more': () {
                true.should.not.beFalse();
              }
            },
          );
        });
      });
    });
  });
}
