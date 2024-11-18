import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final CollectionReference _productCollection = FirebaseFirestore.instance.collection('products');

  Stream<List<Product>> getProducts() {
    return _productCollection.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Product.fromFirestore(doc.data() as Map<String, dynamic>)).toList());
  }
}
