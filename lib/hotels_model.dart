class HotelsModel {
  final String? address;
  final String? description;
  final String? image;
  final int? id;
  final String? name;
  final Map<String, dynamic>? price;
  final double? rating;
  final int? stars;

  HotelsModel({
    required this.address,
    required this.description,
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.stars,
  });

  factory HotelsModel.fromJson(Map<String, dynamic> json) {
    return HotelsModel(
      address: json['address'],
      description: json['description'],
      image: json['photoUrls'][0],
      id: json['id'],
      name: json['name'],
      price: json['priceBreakdown']['grossPrice'],
      rating: json['reviewScore'].runtimeType == double
          ? json['reviewScore']
          : double.parse(json['reviewScore'].toString()),
      stars: json['propertyClass'],
    );
  }

  HotelsModel copyWith(HotelsModel model) {
    return HotelsModel(
      address: model.address ?? address,
      description: model.description ?? description,
      image: model.image ?? image,
      id: model.id ?? id,
      name: model.name ?? name,
      price: model.price ?? price,
      rating: model.rating ?? rating,
      stars: model.stars ?? stars,
    );
  }
}
