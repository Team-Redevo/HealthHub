// import firebase confiiguration
require('dotenv').config();

// include and initialize firebase
const { initializeApp } = require('firebase/app');
const { getFirestore, doc, updateDoc, arrayUnion } = require('firebase/firestore');
const firebaseConfig = {
    apiKey: process.env.apiKey,
    authDomain: process.env.authDomain,
    projectId: process.env.projectId,
    storageBucket: process.env.storageBucket,
    messagingSenderId: process.env.senderId,
    appId: process.env.appId
};
const firebaseApp = initializeApp(firebaseConfig);
const db = getFirestore(firebaseApp);

// include and initialize express framework
const express = require("express");
const app = express();
const port = 3000;

// route for the home page
app.get("/", (req, res) => {
  res.send("Hello you!");
});

// route to handle prescriptions
app.get("/prescription", (req, res) => {
  const cnp = req.query.cnp;
  var substances = req.query.substances;

  // check if both cnp and substances are provided
  if (cnp && substances) {
    var docRef = doc(db, "user_id", cnp);
    updateDoc(docRef, {
    prescriptions: arrayUnion(
        {
            "prescription" : substances
        }
    )
    })
    res.send("Success!");
  } else {
    res.send("Error! Please provide all data!");
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
