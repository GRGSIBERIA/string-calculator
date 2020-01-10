import 'dart:html';

double getValueOnInput(String idname) {
  InputElement input = document.querySelector(idname) as InputElement;
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
