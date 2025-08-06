import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final photoNotesCollection = FirebaseFirestore.instance.collection('users').doc(fbAuth.currentUser!.uid).collection('photoNotes');
final fbAuth = FirebaseAuth.instance;