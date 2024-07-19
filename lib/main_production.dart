import 'package:examplearch/app/presentation/app/app.dart';
import 'package:examplearch/bootstrap.dart';
import 'package:injectable/injectable.dart';

void main() async {
  bootstrap(() => const MyApp(), Environment.prod);
}
