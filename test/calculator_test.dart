import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

import 'calculator.dart';

void main() {
  given('empty calculator', () {
    late Calculator calc;

    before(() {
      calc = Calculator();
    });

    when2('add 1', () => calc.add(1), then: () {
      then('result should be 1', () {
        calc.res.should.be(1);
      });

      when2('[and] substract 1', () => calc.substract(1), then: () {
        then('res should be 0', () {
          calc.res.should.beZero();
        });
      });
    });
  });

  given('empty calculator (2)', () {
    late Calculator calc;
    before(() {
      calc = Calculator();
    });

    when('add 1', () {
      before(() => calc.add(1));
      then('result should be 1', () {
        calc.res.should.be(1);
      });

      when('[and] substract 1', () {
        before(() => calc.substract(1));
        then('res should be 0', () {
          calc.res.should.beZero();
        });
      });
    });
  });
}
