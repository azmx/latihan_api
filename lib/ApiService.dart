// services/api_service.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_api/PremierLeagueModel.dart';

import 'PostModel.dart';

class ApiService {
  final String baseUrl = ' https://www.thesportsdb.com';

  Future<List<Team>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> teamsJson = data['teams'];
    return teamsJson.map((json) => Team.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
  }
}