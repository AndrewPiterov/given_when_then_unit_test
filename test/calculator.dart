class Calculator {
  num _val = 0;
  num get res => _val;

  void add(num value) {
    _val = _val + value;
  }

  void substract(int value) {
    _val = _val - value;
  }
}
