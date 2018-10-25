package com.example.dialogflow;

import com.google.cloud.dialogflow.v2.DetectIntentResponse;
import com.google.cloud.dialogflow.v2.QueryInput;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.google.cloud.dialogflow.v2.SessionName;
import com.google.cloud.dialogflow.v2.SessionsClient;
import com.google.cloud.dialogflow.v2.TextInput;
import com.google.cloud.dialogflow.v2.TextInput.Builder;
import com.google.cloud.dialogflow.v2.Intent;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * DialogFlow API Detect Intent sample with text inputs.
 */
public class DetectIntentTexts {

  // [START dialogflow_detect_intent_text]
  /**
   * Returns the result of detect intent with texts as inputs.
   *
   * Using the same `session_id` between requests allows continuation of the conversation.
   * @param projectId Project/Agent Id.
   * @param texts The text intents to be detected based on what a user says.
   * @param sessionId Identifier of the DetectIntent session.
   * @param languageCode Language code of the query.
   */
  public static void detectIntentTexts(
    String projectId, List<String> texts, String sessionId, String languageCode
  ) throws Exception {
    // Instantiates a client
    try (
      SessionsClient sessionsClient = SessionsClient.create()
    ) {
      // Set the session name using the sessionId (UUID) and projectID (my-project-id)
      SessionName session = SessionName.of(projectId, sessionId);
      System.out.println("Session Path: " + session.toString());

      // Detect intents for each text input
      for (String text : texts) {
        // Set the text (hello) and language code (en-US) for the query
        Builder textInput = TextInput.newBuilder().setText(text).setLanguageCode(languageCode);

        // Build the query with the TextInput
        QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();

        // Performs the detect intent request
        DetectIntentResponse response = sessionsClient.detectIntent(session, queryInput);

        // Display the query result
        QueryResult queryResult = response.getQueryResult();

        System.out.println("====================");
        System.out.format("Query Text: '%s'\n", queryResult.getQueryText());
        System.out.format(
          "Detected Intent: %s (confidence: %f)\n",
          queryResult.getIntent().getDisplayName(), queryResult.getIntentDetectionConfidence()
        );
        System.out.format("Fulfillment Text: '%s'\n", queryResult.getFulfillmentText());
      }
    }
  }
  // [END dialogflow_detect_intent_text]

  // [START run_application]
  public static void main(String[] args) throws Exception {
    ArrayList<String> texts = new ArrayList<>();
    String projectId = "";
    String sessionId = UUID.randomUUID().toString();
    String languageCode = "en-US";

    projectId = "aguas-de-barcelona";
    sessionId = "1";
    languageCode = "es";
    texts.add("agua");

    System.out.println(projectId);
    System.out.println(texts);

    detectIntentTexts(projectId, texts, sessionId, languageCode);
  }
  // [END run_application]
}
