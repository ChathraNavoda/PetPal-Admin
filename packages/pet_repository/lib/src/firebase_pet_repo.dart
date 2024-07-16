import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_repository/pet_supplies_repository.dart';

class FirebasePetRepo implements ItemRepo {
  final itemsCollection = FirebaseFirestore.instance.collection("items");

  @override
  Future<List<Item>> getItems() async {
    try {
      log('Fetching items from Firestore');
      QuerySnapshot querySnapshot = await itemsCollection.get();

      if (querySnapshot.docs.isEmpty) {
        log('No items found in Firestore');
        return [];
      }

      List<Item> items = querySnapshot.docs.map((doc) {
        log('Processing document ${doc.id}');
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Item.fromEntity(ItemEntity.fromDocument(data));
      }).toList();

      log('Successfully fetched ${items.length} items from Firestore');
      return items;
    } catch (e) {
      log('Error fetching items: $e');
      rethrow;
    }
  }
}
