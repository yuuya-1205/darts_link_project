/* eslint-disable max-len */
/* eslint-disable @typescript-eslint/no-unused-vars */

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp(functions.config().firebase);
export const firestore = admin.firestore();

const pushMessage = async function(
    fcmTokens: Array<string>,
    title: string,
    body: string) {
  const payload = {
    notification: {
      title: title,
      body: body,
    },
  };
  const optiion = {
    priority: "high",
  };
  await admin.messaging().sendToDevice(fcmTokens, payload, optiion);
};

const fetchFcmToken = async (reference: FirebaseFirestore.DocumentReference): Promise<Array<string>> => {
  const snapshot = await firestore
      .collection("fcmTokens")
      .where("userReference", "==", reference).get();
  if (snapshot.docs.length != 1) {
    return [];
  }
  return snapshot.docs[0].data()["fcmTokens"];
};

export const sendPushNotificationWhenFollowed =
  functions.firestore
      .document("{userCollectionId}/{userId}/{follows}/{followId}").onCreate(
          async (request, _) => {
            const data = request.data();
            console.log(data);
            const followUserRef = request.ref.parent.parent;
            if (followUserRef == null) {
              return;
            }
            const followUser = await followUserRef.get();
            const reference: FirebaseFirestore.DocumentReference = data["followingRef"];
            const fcmTokens: Array<string> = await fetchFcmToken(reference);
            await pushMessage(fcmTokens, "フォローされました", `${followUser.data()?.["userId"]}にフォローされました`);
          }
      );
