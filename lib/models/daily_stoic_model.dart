class DailyStoicModel {
  final DateTime? date;
  final String title;
  final String name;
  final String quote;
  final String description;

  DailyStoicModel({
    this.date,
    this.title = "",
    this.name = "",
    this.quote = "",
    this.description = "",
  });
}
