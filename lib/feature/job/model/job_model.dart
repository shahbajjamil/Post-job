// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class JobModel {
  final String title;
  final String company;
  final String location;
  final String companyLogo;
  final String experience;
  final DateTime postedDate;
  bool isInterested;
  bool isSaved;

  JobModel({
    required this.title,
    required this.company,
    required this.location,
    required this.companyLogo,
    required this.experience,
    required this.postedDate,
    this.isInterested = false,
    this.isSaved = false,
  });
}

List<JobModel> jobList = [
  JobModel(
    title: "Head Chef",
    company: "ITC Gardenia",
    location: "Bengaluru, Karnataka",
    companyLogo:
        "https://images.template.net/wp-content/uploads/2017/04/Logo-Design1.jpg",
    experience: "5-10 years",
    postedDate: DateTime.now().subtract(const Duration(days: 25)),
  ),
  JobModel(
    title: "Executive Chef",
    company: "Rim Naam",
    location: "Bengaluru, Karnataka",
    companyLogo:
        "https://images.template.net/wp-content/uploads/2017/04/Logo-Design1.jpg",
    experience: "7-12 years",
    postedDate: DateTime.now().subtract(const Duration(days: 14)),
  ),
  JobModel(
    title: "Chef de Partie",
    company: "ITC Gardenia",
    location: "Bengaluru, Karnataka",
    companyLogo:
        "https://images.template.net/wp-content/uploads/2017/04/Logo-Design1.jpg",
    experience: "2-5 years",
    postedDate: DateTime.now().subtract(const Duration(days: 25)),
  ),
  JobModel(
    title: "Sous Chef",
    company: "ITC Gardenia",
    location: "Bengaluru, Karnataka",
    companyLogo:
        "https://images.template.net/wp-content/uploads/2017/04/Logo-Design1.jpg",
    experience: "3-7 years",
    postedDate: DateTime.now().subtract(const Duration(days: 2)),
  ),
  JobModel(
    title: "Chef de Partie",
    company: "ITC Gardenia",
    location: "Bengaluru, Karnataka",
    companyLogo:
        "https://images.template.net/wp-content/uploads/2017/04/Logo-Design1.jpg",
    experience: "2-5 years",
    postedDate: DateTime.now().subtract(const Duration(days: 5)),
  ),
  JobModel(
    title: "Sous Chef",
    company: "ITC Gardenia",
    location: "Bengaluru, Karnataka",
    companyLogo:
        "https://images.template.net/wp-content/uploads/2017/04/Logo-Design1.jpg",
    experience: "3-7 years",
    postedDate: DateTime.now().subtract(const Duration(days: 10)),
  ),
];
