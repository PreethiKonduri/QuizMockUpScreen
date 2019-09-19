import 'package:cloud_firestore/cloud_firestore.dart';

class Quizes {
  Map<String, DateTime> activeTimePeriod;
  Timestamp createdOn;
  int numberOfSubmissions;
  List<String> questions = []; //todo: update the type to Questions
  String status;
  List<String> tags;
  String title;
  Timestamp updatedOn;

  Quizes(
      {this.title,
      this.createdOn,
      this.updatedOn,
      this.activeTimePeriod,
      this.questions,
      this.numberOfSubmissions,
      this.tags,
      this.status});

  // Return object from JSON //
  factory Quizes.fromJson(Map<String, dynamic> json) {
    return Quizes(
      title: json['title'] as String,
      createdOn: Timestamp.fromDate(json['createdOn']),
      updatedOn: Timestamp.fromDate(json['updatedOn']),
      activeTimePeriod:
          new Map<String, DateTime>.from(json['activeTimePeriod']),
      questions: new List<String>.from(json['questions']),
      numberOfSubmissions: json['numberOfSubmissions'] as int,
      tags: new List<String>.from(json['tags']),
      status: json['status'] as String,
    );
  }
}
