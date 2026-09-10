import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_layout/main.dart';

void main() {
  testWidgets('Memastikan Aplikasi Katalog Beranda Tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Beranda Katalog'), findsOneWidget);
    expect(find.text('Kopi Susu Gula Aren'), findsOneWidget);

    expect(find.byType(ListTile), findsNWidgets(3));
  });

  testWidgets('Navigasi dari Beranda ke Detail Katalog', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Kopi Susu Gula Aren'));
    await tester.pumpAndSettle(); 
    
    expect(find.text('Detail Katalog'), findsOneWidget);
    expect(find.text('Paduan espresso dengan susu segar dan gula aren pilihan.'), findsOneWidget);
  });
}