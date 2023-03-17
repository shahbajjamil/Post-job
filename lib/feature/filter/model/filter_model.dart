enum OptionType {
  checkbox,
  radio,
}

class FilterModel {
  final String title;
  bool selected;
  List<String> options;
  OptionType optionType;

  FilterModel({
    required this.title,
    this.selected = false,
    required this.options,
    this.optionType = OptionType.checkbox,
  });
}

// Chef type
// Date posted
// Gender
// // • Recent
// // O Last month
// // • Last week
// // Any time
// Service Type
// Job Type
// Shift Timing
// Do you cook?
// Cuisines
// Ready to Work Witin
// Salary Cycle
// Expected Salary
// Accomodation
// Food
// Dress
// Passport

List<FilterModel> filterTypeList = [
  FilterModel(
    title: 'Chef type',
    options: [
      'Chef',
      'Cook',
      'Chef de Partie',
      'Sous Chef',
      'Chef de Cuisine',
      'Pastry Chef',
      'Chef Tournant',
      'Chef de Rang',
      'Chef de Partie',
    ],
  ),
  FilterModel(
    title: 'Date posted',
    options: [
      'Recent',
      'Last month',
      'Last week',
      'Any time',
    ],
    optionType: OptionType.radio,
  ),
  FilterModel(
    title: 'Gender',
    options: ["Male", "Female", "Others"],
    optionType: OptionType.radio,
  ),
  FilterModel(title: 'Service Type', options: []),
  FilterModel(title: 'Job Type', options: [
    "Full Time",
    "Part Time",
    "Temporary",
    "Contract",
    "Internship",
    "Volunteer",
  ]),
  FilterModel(title: 'Shift Timing', options: []),
  FilterModel(title: 'Do you cook?', options: []),
  FilterModel(title: 'Cuisines', options: []),
  FilterModel(title: 'Ready to Work Witin', options: []),
  FilterModel(title: 'Salary Cycle', options: []),
  FilterModel(title: 'Expected Salary', options: []),
  FilterModel(title: 'Accomodation', options: []),
  FilterModel(title: 'Food', options: []),
  FilterModel(title: 'Dress', options: []),
  FilterModel(title: 'Passport', options: []),
];
