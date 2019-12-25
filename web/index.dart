import 'dart:html';

void main() {
  var message = new DivElement()..text = "hoge";
  document.body.append(message);
  
  ButtonElement button = document.querySelector("#calculate-btn");
  button..onClick.listen((_) => print("hogehoge"));
}