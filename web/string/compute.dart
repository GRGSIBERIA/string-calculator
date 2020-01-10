import 'dart:html';
import 'dart:math';
import '../util.dart';

// 列番号を一応記録しておく
int index = 1;

// 材料定数マップ，比重，ヤング率の順番で格納
const Map<String, List<double>> materials = {
  "SUS430": [7.70e-9, 2.00e5],
  "C2600" : [8.53e-9, 1.10e5],
  "S45C"  : [7.80e-9, 2.05e5]
};

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

void applyMaterial() {
  final String selectedItem = (document.querySelector("#material-selector") as SelectElement).value;
  final double density = materials[selectedItem][0];
  final double youngsModulus = materials[selectedItem][1];

  recordValueOnInput(density, "#density");
  recordValueOnInput(youngsModulus, "#youngs-modulus");

  writeConsole("Applyed constants of a material: " + selectedItem);
}