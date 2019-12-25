import 'dart:html';
import 'dart:math';


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

void recordValueOnInput(double value, String idname) {
  InputElement input = document.querySelector(idname) as InputElement;
  try {
    input.value = value.toString();
  } catch (exception) {
    window.alert("計算できませんでした：" + idname);
  }
}

void writeConsole(String text) {
  var message = new DivElement()..text = text;
  document.body.append(message);
}

void computeString() {
  final double len0 = getValueOnInput('#length');
  final double diameter = getValueOnInput('#diameter');
  final double frequency = getValueOnInput('#frequency');
  final double density = getValueOnInput('#density');
  final double young = getValueOnInput('#youngs-modulus');

  final double crossSection = pow(diameter/2.0, 2.0) * pi;
  final double stringDensity = crossSection * density;  
  final double stress = 4.0 * pow(len0 * frequency, 2.0) * density;
  final double tension = stress * crossSection;
  final double strain = stress / young;
  final double stretch = (len0 * stress) / young;
  final double reallyLength = len0 + stretch;

  recordValueOnInput(crossSection, '#cross-section');
  recordValueOnInput(stringDensity, '#string-density');
  recordValueOnInput(stress, '#stress');
  recordValueOnInput(tension, '#tension');
  recordValueOnInput(strain, '#strain');
  recordValueOnInput(stretch, '#stretch');
  recordValueOnInput(reallyLength, '#really-length');

  writeConsole("Computed results.");
}