class CategoryFilterModel {
  final int id;
  final String type;
  final String name;
  final String? value;
  final List<CategoryFilterChildModel> childs;

  CategoryFilterModel({
    required this.id,
    required this.type,
    required this.name,
    this.value = '',
    required this.childs,
  });
}

class CategoryFilterChildModel {
  final int id;
  final String? type;
  final String name;
  final String value;
  final bool isActive;

  CategoryFilterChildModel({
    required this.id,
    this.type = "",
    required this.name,
    required this.value,
    this.isActive = false,
  });
}
