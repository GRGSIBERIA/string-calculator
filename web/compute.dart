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

// 列番号を一応記録しておく
int index = 1;

void addTd(String idname, num value) {
  var tdElement = new Element.td()..innerText = value.toString();
  document.querySelector(idname).append(tdElement);
}

void addComputeResult() {
  // id名を変えたときに影響を少なくするため分けて書いた
  addTd("#index-tr", index);
  addTd("#length-tr", getValueOnInput("#length"));
  addTd("#diameter-tr", getValueOnInput("#diameter"));
  addTd("#frequency-tr", getValueOnInput("#frequency"));
  addTd("#density-tr", getValueOnInput("#density"));
  addTd("#youngs-modulus-tr", getValueOnInput("#youngs-modulus"));
  addTd("#string-density-tr", getValueOnInput("#string-density"));
  addTd("#cross-section-tr", getValueOnInput("#cross-section"));
  addTd("#strain-tr", getValueOnInput("#strain"));
  addTd("#tension-tr", getValueOnInput("#tension"));
  addTd("#stress-tr", getValueOnInput("#stress"));
  addTd("#stretch-tr", getValueOnInput("#stretch"));
  addTd("#really-length-tr", getValueOnInput("#really-length"));

  writeConsole("Saved results of inputs to a table.");

  ++index;
}