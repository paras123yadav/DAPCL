// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

import 'dart:convert';

Product ProductFromJson(String str) => Product.fromJson(json.decode(str));

String ProductToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<ProductDetails> data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    status: json["status"],
    message: json["message"],
    data: List<ProductDetails>.from(json["data"].map((x) => ProductDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductDetails {
  ProductDetails({
    required this.productId,
    required this.catId,
    required this.productName,
    required this.productImage,
    required this.varients,
  });

  int productId;
  int catId;
  String productName;
  String productImage;
  List<Varient> varients;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    productId: json["product_id"],
    catId: json["cat_id"],
    productName: json["product_name"],
    productImage: json["product_image"],
    varients: List<Varient>.from(json["varients"].map((x) => Varient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "cat_id": catId,
    "product_name": productName,
    "product_image": productImage,
    "varients": List<dynamic>.from(varients.map((x) => x.toJson())),
  };
}

class Varient {
  Varient({
    required this.varientId,
    required this.productId,
    required this.quantity,
    required this.unit,
    required this.mrp,
    required this.price,
    required this.description,
    required this.varientImage,
  });

  int varientId;
  int productId;
  int quantity;
  String unit;
  int mrp;
  int price;
  String description;
  String varientImage;

  factory Varient.fromJson(Map<String, dynamic> json) => Varient(
    varientId: json["varient_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    unit: json["unit"],
    mrp: json["mrp"],
    price: json["price"],
    description: json["description"],
    varientImage: json["varient_image"],
  );

  Map<String, dynamic> toJson() => {
    "varient_id": varientId,
    "product_id": productId,
    "quantity": quantity,
    "unit": unit,
    "mrp": mrp,
    "price": price,
    "description": description,
    "varient_image": varientImage,
  };
}
