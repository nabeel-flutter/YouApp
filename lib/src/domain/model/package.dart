import 'package:equatable/equatable.dart';

class Package extends Equatable {
  final String name;
  final String colorCode;
  final int price;
  final int priceYearly;
  final int discountedPrice;

  final int discountedYearlyPrice;
  const Package({
    required this.name,
    required this. discountedYearlyPrice,
    required this.colorCode,
    required this.price,
    required this.priceYearly,
    required this.discountedPrice,
  });

  @override
  List<Object?> get props => [
        name,
        colorCode,
        price,
        priceYearly,
        discountedPrice,
      ];
}
