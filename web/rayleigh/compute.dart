import 'dart:math';

import '../util.dart';

void computeRayleigh() {
  final double f1 = getValueOnInput('#lowfreq');
  final double f2 = getValueOnInput('#highfreq');
  final double z1 = getValueOnInput('#lowdecay');
  final double z2 = getValueOnInput('#highdecay');

  final double o1 = f1 * 2.0 * pi;
  final double o2 = f2 * 2.0 * pi;

  final double b = (2.0 * (o1 * z1 - o2 * z2)) / (pow(o1,2) - pow(o2,2));
  final double a = 2.0 * o1 * z1 - b * pow(o1, 2);

  recordValueOnInput(b, "#beta");
  recordValueOnInput(a, "#alpha");
}