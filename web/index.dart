import 'dart:html';
import 'compute.dart';


void main() {
  var button = document.querySelector("#calculate-btn");
  button..onClick.listen((_) => computeString());

  writeConsole("Loaded dart scripts.");
}
