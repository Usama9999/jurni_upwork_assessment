import 'package:UpworkAssessment/globals/imports.dart';

extension SizedBoxExtension on int {
  Widget get hp => SizedBox(
        height: toDouble(),
      );
  Widget get wp => SizedBox(
        width: toDouble(),
      );
}
