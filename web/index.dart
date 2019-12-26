import 'dart:html';
import 'compute.dart';

void main() {
  document.querySelector("#calculate-btn")..onClick.listen((_) => computeString());
  document.querySelector("#add-btn")..onClick.listen((_) => addComputeResult());

  writeConsole("Loaded dart scripts.");
}
