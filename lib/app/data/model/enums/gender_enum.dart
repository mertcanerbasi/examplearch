import 'package:flutter/material.dart';
import 'package:examplearch/core/util/context_ex.dart';

enum Gender {
  male,
  female,
  other,
}

String decideGender(BuildContext context, Gender gender) {
  switch (gender) {
    case Gender.male:
      return context.appLocalizations.male;
    case Gender.female:
      return context.appLocalizations.female;
    case Gender.other:
      return context.appLocalizations.other;
    default:
      return context.appLocalizations.other;
  }
}
