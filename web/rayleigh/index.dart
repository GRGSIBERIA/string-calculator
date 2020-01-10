import 'dart:html';
import 'compute.dart';
import '../util.dart';

void main() {
  document.querySelector("#calculate-btn")..onClick.listen((_) => computeRayleigh());

  writeConsole("Loaded dart scripts.");
}