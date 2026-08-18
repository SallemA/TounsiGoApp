TounsiGo v0.2

Neu:
- Phrase-Datenmodell
- Lesson-Datenmodell
- LessonRepository
- erste echte Begrüßungslektion
- Lernkarten mit Tounsi + Arabisch + Deutsch
- Vor/Zurück-Navigation
- Fortschrittsbalken
- Abschlussdialog
- Home führt direkt in die Lektion
- weitere Lektionen als "demnächst"

Installation:
1. ZIP entpacken.
2. Den enthaltenen lib-Ordner über C:\dev\tounsigo\lib kopieren.
3. Bestehende Dateien ersetzen.
4. Dann:
   flutter clean
   flutter pub get
   flutter run -d emulator-5554

Git:
   git add .
   git commit -m "Add first greeting lesson and learning flow"
   git push

Hinweis:
Der Audio-Button ist noch ein Platzhalter.
Als nächstes: Lokalisierung + echte Audio-Assets + lokaler Fortschritt.
