import 'package:empresas_flutter/src/pages/login_page/login_page.dart';
import 'package:empresas_flutter/src/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  testWidgets('should find the button to enter ', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));
    final gestureFinder = find.text("ENTRAR");

    expect(gestureFinder, findsOneWidget);
  });
}
