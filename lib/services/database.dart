import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;

  DatabaseService({ this.uid });

  // Collection reference
  final CollectionReference beenThereCollection = Firestore.instance.collection('beentheres');

  Future newUser() async {
    return await beenThereCollection.document(uid).setData({'userid' : uid});
  }
}