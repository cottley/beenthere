import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;

  DatabaseService({ this.uid });

  // Collection reference
  final CollectionReference beenThereCollection = Firestore.instance.collection('beentheres');

  Future newUser() async {
    List<String> cats = [];
    cats.add('Family');
    cats.add('Friends');
    cats.add('Work');
    cats.add('School');

    return await beenThereCollection.document(uid).setData({'userid' : uid, 'categories': cats});
  }

  Stream<QuerySnapshot> get beentheres {
    return beenThereCollection.snapshots();
  }
}