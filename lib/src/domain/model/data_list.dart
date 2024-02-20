import 'package:equatable/equatable.dart';

class DataList<T> extends Equatable {
  static const defaultSize = 0;

  final List<T> items;
  final int currentPage;
  final int pageSize;
  final int totalPages;

  const DataList({
    required this.items,
    this.currentPage = defaultSize,
    this.pageSize = defaultSize,
    this.totalPages = defaultSize,
  });

  @override
  List<Object> get props => [items, currentPage, pageSize, totalPages];

  bool hasNext() => currentPage < totalPages;

  int nextPage() => hasNext() ? currentPage + 1 : 0;
}
