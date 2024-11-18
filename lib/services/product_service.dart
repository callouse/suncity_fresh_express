import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromFirestore(doc.data());
      }).toList();
    });
  }

  Future<Product> getProductById(String id) async {
    final doc = await _firestore.collection('products').doc(id).get();
    return Product.fromFirestore(doc.data()!);
  }
}
