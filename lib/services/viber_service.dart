import 'package:http/http.dart' as http;

class ViberService {
  Future<void> sendOrder(String name, String apartment, List<Map<String, dynamic>> items) async {
    final message = 'Order from $name, Apartment $apartment:\n' +
        items.map((item) => '- ${item["name"]} (${item["quantity"]})').join('\n');

    final response = await http.post(
      Uri.parse('https://chatapi.viber.com/pa/send_message'),
      headers: {
        'Content-Type': 'application/json',
        'X-Viber-Auth-Token': 'YOUR_VIBER_API_TOKEN'
      },
      body: '''{
        "receiver": "YOUR_VIBER_USER_ID",
        "min_api_version": 1,
        "sender": {"name": "Suncity Fresh Express"},
        "tracking_data": "tracking data",
        "type": "text",
        "text": "$message"
      }''',
    );

    if (response.statusCode == 200) {
      print("Message sent!");
    } else {
      print("Failed to send message: ${response.body}");
    }
  }
}
