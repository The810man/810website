import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:eight_ten_studios/app/app.dart';

void main() {
  testWidgets('homepage renders the hero headline', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pump();

    expect(find.text('810 Studios'), findsOneWidget);

    // Let the terminal-typing timers run to completion (they self-cancel)
    // so the test binding doesn't see a timer still pending at teardown.
    await tester.pump(const Duration(seconds: 3));
  });
}
