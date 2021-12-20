import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  GivenWhenThenOptions.pads = 4;

  given('the account balance is \$100', () {
    and('the card is valid', () {
      and('the machine contains enough money', () {
        when('the Account Holder requests \$20', () {
          then(
            'the Cashpoint should dispense',
            () {
              true.should.beTrue();
            },
            and: {
              'the account balance should be \$80': () {
                true.should.beTrue();
              },
              'the card should be returned': () {
                true.should.beTrue();
              },
            },
          );
        });
      });
    });
  });
}
