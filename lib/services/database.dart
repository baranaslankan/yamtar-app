import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference profiles=FirebaseFirestore.instance.collection('profiles');
  
  Future updateUserData(String nameSurname,String email,String image)async{
    return await profiles.doc(uid).set({
      'nameSurname':nameSurname,
      'email':email,
      'image':image,
    });
  }

  }