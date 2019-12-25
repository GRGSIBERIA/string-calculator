import 'dart:html';


double getValueOnInput(String idname) {
  var input = document.querySelector(idname) as InputElement;
  double value = 0.0;
  try {
    value = double.parse(input.value);
  } catch (exception) {
    window.alert("不正な値が入力されています：" + idname);
  }
  return value;
}

void writeConsole(String text) {
  var message = new DivElement()..text = text;
  document.body.append(message);
}

void computeString() {
  double len0 = getValueOnInput('#length');
  double diameter = getValueOnInput('#diameter');
  double freq = getValueOnInput('#frequency');
  double density = getValueOnInput('#density');
  double young = getValueOnInput('#youngs-modulus');

  writeConsole("Computed results.");
}