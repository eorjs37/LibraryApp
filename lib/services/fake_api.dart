Future<List<String>> fakeApi(int page, int size) async {
  await Future.delayed(const Duration(seconds: 1));

  final allData = List.generate(10, (i) => "Item ${i}");

  final start = (page - 1) * size;
  if (start >= allData.length) return [];

  final end = (start + size > allData.length) ? allData.length : start + size;

  return allData.sublist(start, end);
}
