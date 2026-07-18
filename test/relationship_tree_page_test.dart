import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heartsync/features/relationship_tree/pages/relationship_tree_page.dart';

void main() {
  testWidgets('RelationshipTreePage shows the tree title', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: RelationshipTreePage()));

    expect(find.text('İlişki Ağacı'), findsOneWidget);
  });
}
