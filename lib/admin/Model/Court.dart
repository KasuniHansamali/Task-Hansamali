import 'package:cloud_firestore/cloud_firestore.dart';

class Court {
  final String advertise;
  final String price;
  final String courtname;
  final String searchKey;
  final DocumentReference reference;

  Court.fromMap(Map<String, dynamic>? map, {required this.reference})
      : assert(map!['advertise'] != null),
        assert(map!['courtname'] != null),
        assert(map!['price'] != null),
        assert(map!['searchKey'] != null),
        advertise = map!['advertise'],
        price = map['price'],
        courtname = map['courtname'],
        searchKey = map['searchKey'];

  Court.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$advertise:$price:$courtname:$searchKey>";
}
