import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Recipe extends Equatable {
  int id;
   String title;
   int servings;
   String duration;

  Recipe(
      {this.id,@required this.title, @required this.servings, @required this.duration});

  @override
  // TODO: implement props
  List<Object> get props => [id,title,servings,duration];

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      servings: json['servings'],
      duration: json['duration'],
    );
  }

  @override
  String toString() => 'Recipe { id: $id, title: $title, servings: $servings, serving: $duration }';
}
