# Given When Then

[example.dart](./lib/example.dart)

```dart
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

    when('[and] subtract 1', () {
      before(() => calc.subtract(1));
      then('res should be 0', () {
        calc.res.should.beZero();
      });
    });
  });
});
```
