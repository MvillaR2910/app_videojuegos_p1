import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_constants.dart';

class ApiService {
  Future<List<dynamic>> fetchGames() async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/games?key=${ApiConstants.apiKey}",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results']; // Retorna la lista de juegos
    } else {
      throw Exception("Error al cargar los videojuegos");
    }
  }

  Future<List<dynamic>> fetchGamesByGenre(String genre) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/games?key=${ApiConstants.apiKey}&genres=$genre",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results']; // Retorna la lista de juegos filtrados por género
    } else {
      throw Exception("Error al cargar los videojuegos por género");
    }
  }
}
