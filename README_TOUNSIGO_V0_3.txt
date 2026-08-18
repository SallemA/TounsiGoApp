TounsiGo v0.3

Neu:
- Onboarding
- Sprachauswahl (Deutsch)
- Lernzielauswahl
- Navigation: Heute / Sprechen / Entdecken / Ich
- erster Conversation-Flow "Im Café"
- anfängerfreundliche Umschrift ohne Arabizi-Ziffern
- Audio- und Mikrofon-UI vorbereitet
- Widget-Test aktualisiert

Wichtig:
Diese Version speichert Onboarding und Fortschritt noch NICHT dauerhaft.
Das kommt im nächsten Schritt mit lokaler Speicherung.

Installation:
1. ZIP entpacken.
2. Den enthaltenen lib-Ordner über C:\dev\tounsigo\lib kopieren.
3. test\widget_test.dart ebenfalls ersetzen.
4. Dann:

   dart format .
   flutter analyze
   flutter test
   flutter run -d emulator-5554

Git:
   git add .
   git commit -m "Add onboarding and speaking-first navigation"
   git push
