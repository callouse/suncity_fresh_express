import 'package:http/http.dart' as http;

class ViberService {
  final String viberApiKey = "YOUR_VIBER_API_KEY"; // Replace with your Viber API Key
  final String viberAccountId = "YOUR_VIBER_ACCOUNT_ID"; // Replace with your Viber Account ID

  Future<void> sendOrderMessage(String message) async {
    final url = Uri.parse("https://chatapi.viber.com/pa/send_message");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-Viber-Auth-Token": viberApiKey,
      },
      body: """
      {
        "receiver": "$viberAccountId",
        "min_api_version": 7,
        "sender": {
          "name": "Suncity Fresh Express",
          "avatar": "https://example.com/avatar.jpg"
        },
        "tracking_data": "tracking data",
        "type": "text",
        "text": "$message"
      }
      """,
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to send Viber message: ${response.body}");
    }
  }
}
