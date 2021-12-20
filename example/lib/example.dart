// ignore_for_file: public_member_api_docs

import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';
import 'package:test/test.dart';

class Calculator {
  num _val = 0;
  num get res => _val;

  void add(num value) {
    _val = _val + value;
  }

  void subtract(int value) {
    _val = _val - value;
  }
}

void main() {
  group('calculator', () {
    late Calculator calc;
    setUp(() => calc = Calculator());

    group('add 1', () {
      setUp(() => calc.add(1));
      test('result should be 1', () {
        expect(calc.res, 1);
      });

      group('[and] substract 1', () {
        setUp(() => calc.subtract(1));
        test('res should be 0', () {
          expect(calc.res, isZero);
        });
      });
    });
  });

  // You can rewrite tests above with Given When Then + Shouldly as a common English sentence
  given('calculator', () {
    late Calculator calc;

    before(() {
      calc = Calculator();
    });

    when('add 1', () {
      before(() => calc.add(1));
      then('result should be 1', () {
        calc.res.should.be(1);
      });

      and('subtract 1', () {
        before(() => calc.subtract(1));

        then('res should be 0', () {
          calc.res.should.beZero();
        });
      });
    });
  });
}
