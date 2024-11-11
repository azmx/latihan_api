// To parse this JSON data, do
//
//     final premierLeague = premierLeagueFromJson(jsonString);

import 'dart:convert';

PremierLeague premierLeagueFromJson(String str) => PremierLeague.fromJson(json.decode(str));

String premierLeagueToJson(PremierLeague data) => json.encode(data.toJson());

class PremierLeague {
    List<Category> categories;

    PremierLeague({
        required this.categories,
    });

    factory PremierLeague.fromJson(Map<String, dynamic> json) => PremierLeague(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    String idCategory;
    String strCategory;
    String strCategoryThumb;
    String strCategoryDescription;

    Category({
        required this.idCategory,
        required this.strCategory,
        required this.strCategoryThumb,
        required this.strCategoryDescription,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
    );

    Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
    };
}
