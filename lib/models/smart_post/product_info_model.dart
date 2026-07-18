class ProductInfoModel {
  const ProductInfoModel({
    required this.thumbnail,
    required this.name,
    this.price,
    this.discountLabel,
    this.trendingText,
    this.storeLink,
  });

  final String thumbnail;
  final String name;
  final String? price;
  final String? discountLabel;
  final String? trendingText;
  final String? storeLink;

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) {
    return ProductInfoModel(
      thumbnail: json['thumbnail'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as String? ?? '',
      discountLabel: json['discount_label'] as String? ?? '',
      trendingText: json['trending_text'] as String? ?? '',
      storeLink: json['store_link'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'thumbnail': thumbnail,
        'name': name,
        'price': price,
        'discount_label': discountLabel,
        'trending_text': trendingText,
        'store_link': storeLink,
      };
}
