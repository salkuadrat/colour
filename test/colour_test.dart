import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:colour/colour.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Normal color', () {
    assert(Colour(0xFFFFFFFF).value == Color(0xFFFFFFFF).value);
    assert(Colour(0x00000000).value == Color(0x00000000).value);
  });

  test('Normal color with opacity', () {
    assert(Colour(0xFFFFFFFF, 0.25).value == Color(0xFFFFFFFF).withOpacity(0.25).value);
    assert(Colour(0x00000000, 0.5).value == Color(0x00000000).withOpacity(0.5).value);

    // use existing color with opacity
    Color color = Color(0xFFFFFFFF);
    assert(Colour(color, 0.75).value == color.withOpacity(0.75).value);
  });

  test('Normal hex color', () {
    assert(Colour('121212').value == Color(0xFF121212).value);
    assert(Colour('#121212').value == Color(0xFF121212).value);
  });

   test('Normal hex color with opacity', () {
    assert(Colour('121212', 0.25).value == Color(0xFF121212).withOpacity(0.25).value);
    assert(Colour('#121212', 0.5).value == Color(0xFF121212).withOpacity(0.5).value);
  });

  test('Hex color with transparency', () {
    assert(Colour('FF121212').value == Color(0xFF121212).value);
    assert(Colour('B1121212').value == Color(0xB1121212).value);
    assert(Colour('#B1121212').value == Color(0xB1121212).value);
    assert(Colour('#00121212').value == Color(0x00121212).value);
  });

  test('Hex color with transparency and opacity', () {
    assert(Colour('FF121212', 0.25).value == Color(0xFF121212).withOpacity(0.25).value);
    assert(Colour('B1121212', 0.5).value == Color(0xB1121212).withOpacity(0.5).value);
    assert(Colour('#B1121212', 0.25).value == Color(0xB1121212).withOpacity(0.25).value);
    assert(Colour('#00121212', 0.5).value == Color(0x00121212).withOpacity(0.5).value);
  });

  test('RGB color', () {
    assert(Colour(255, 255, 255).value == Color.fromARGB(255, 255, 255, 255).value);
    assert(Colour(0, 0, 0).value == Color.fromARGB(255, 0, 0, 0).value);
    assert(Colour(123, 24, 80).value == Color.fromARGB(255, 123, 24, 80).value);
  });

  test('ARGB color', () {
    assert(Colour(255, 255, 255, 255).value == Color.fromARGB(255, 255, 255, 255).value);
    assert(Colour(0, 0, 0, 0).value == Color.fromARGB(0, 0, 0, 0).value);
    assert(Colour(75, 123, 24, 80).value == Color.fromARGB(75, 123, 24, 80).value);
  });

  test('RGBO color', () {
    assert(Colour(255, 255, 255, 1.0).value == Color.fromRGBO(255, 255, 255, 1.0).value);
    assert(Colour(0, 0, 0, 0.0).value == Color.fromRGBO(0, 0, 0, 0.0).value);
    assert(Colour(75, 123, 24, 0.25).value == Color.fromRGBO(75, 123, 24, 0.25).value);
  });
}
