import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app/main.dart';

void main() {
  testWidgets('Shopping App builds successfully', (tester) async {
    await tester.pumpWidget(const ShoppingApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
