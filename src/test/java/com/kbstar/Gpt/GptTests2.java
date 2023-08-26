package com.kbstar.Gpt;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
public class GptTests2 {
    public static void main(String[] args) {
        String apiKey = "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";
        String prompt = "Once upon a time";
        String apiUrl = "https://api.openai.com/v1/engines/davinci/completions";

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", "Bearer " + apiKey);
            connection.setDoOutput(true);

            String requestBody = "{\"prompt\": \"" + prompt + "\", \"max_tokens\": 50}";
            connection.getOutputStream().write(requestBody.getBytes());

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            reader.close();
            connection.disconnect();

            System.out.println(response.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
