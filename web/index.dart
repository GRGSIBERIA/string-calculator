import 'dart:html';

void main() {
  var message = new DivElement()..text = "hoge";
  document.body.append(message);
}