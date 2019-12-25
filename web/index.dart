import 'dart:html';

void calculate() {
  var len0 = document.querySelector('#length');
  print(len0);
}

void main() {
  var button = document.querySelector("#calculate-btn");
  button..onClick.listen((_) => calculate());

  var message = new DivElement()..text = "Loaded dart scripts.";
  document.body.append(message);
}
