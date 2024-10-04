import 'dart:convert';

class Database {
  static String carts = jsonEncode([
    {
      "id": 1,
      "quantity": 3,
      "category_id": 1,
      "name": "Floral Dress",
      "price": 49.99,
      "category": "Dress",
      "rating": 4.5,
      "description":
          "A charming floral dress perfect for spring and summer. Featuring a lightweight fabric and a flattering fit, this dress is ideal for casual outings or special occasions.",
      "image": "assets/images/shopping/products/products_1.jpg"
    },
    {
      "id": 2,
      "quantity": 2,
      "category_id": 2,
      "name": "Casual Jacket",
      "price": 19.99,
      "category": "Jacket",
      "rating": 4.2,
      "description":
          "A versatile casual jacket designed for everyday wear. Made from durable material, it offers a comfortable fit and is perfect for layering over your favorite outfits.",
      "image": "assets/images/shopping/products/products_2.jpg"
    },
    {
      "id": 3,
      "quantity": 5,
      "category_id": 3,
      "name": "Denim kurti",
      "price": 69.99,
      "category": "kurti",
      "rating": 4.8,
      "description":
          "A stylish denim kurti with a modern twist. This kurti features intricate stitching details and a comfortable cut, making it a great choice for both casual and semi-formal events.",
      "image": "assets/images/shopping/products/products_3.jpg"
    }
  ]);
}
