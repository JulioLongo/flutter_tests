import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/custom_button.dart';

void main() {
  testWidgets('CustomButton muda de cor ao ser pressionado', (WidgetTester tester) async {
    // Constrói o nosso app e dispara um frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: CustomButton(
              text: 'Pressione-me',
              onPressed: () {}, // Função vazia para o teste.
            ),
          ),
        ),
      ),
    );

    // Obtém a referência para o widget CustomButton.
    final Finder customButtonFinder = find.byType(CustomButton);

    // Verifica se a cor inicial é verde.
    expect(
      (tester.widget(customButtonFinder) as CustomButton).state!._isPressed,
      false,
    );
    expect(find.byType(GestureDetector), findsOneWidget);

    // Toca o botão.
    await tester.tap(customButtonFinder);

    // Reconstrói o widget após o toque.
    await tester.pump();

    // Verifica se a cor mudou para azul.
    expect(
      (tester.widget(customButtonFinder) as CustomButton).state!._isPressed,
      true,
    );

    // Toca o botão novamente.
    await tester.tap(customButtonFinder);

    // Reconstrói o widget após o toque.
    await tester.pump();

    // Verifica se a cor voltou para verde.
    expect(
      (tester.widget(customButtonFinder) as CustomButton).state!._isPressed,
      false,
    );
  });
}
