import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ouniee/config/config.dart';

//!FETCH FIREBASE CONFIGURATION CONSTRUCTOR.
final configurations = Configurations();

//!CREATE FIREBASE INITIALIZATION
final Future<FirebaseApp> initialization = Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: configurations.apiKey,
        appId: configurations.appId,
        messagingSenderId: configurations.messagingSenderId,
        projectId: configurations.projectId));

//!CREATE FIREBASE INSTANCES NEEDED FOR THE WEB APP.
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;
