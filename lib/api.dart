import 'package:http/http.dart' as http;

class Api {
  final String apiUrl = "http://test.educatet.com/api/";
  Future<dynamic> get(String endpoint) async {
    var finalEndPoint = Uri.parse(apiUrl + endpoint);
    var response = await http.get(finalEndPoint, headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json, text/plain, */*",
      "Accept-Language": "tr-TR,tr;q=0.9,en-US;q=0.8,en;q=0.7",
      "Accept-Encoding": "gzip, deflate",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzgzMjMxMDg1YmQ2MjUxNGJjMjY3ODNkZDYzZmQ4ZGUwMDkyOGQyZDhhN2MzNDZlYjU2ZDI2Mjc1MzQ4YWZkOTk4Zjg1ZDkwOTM4NDNkMTkiLCJpYXQiOiIxNjMwMDk0OTExLjk0MzE4MSIsIm5iZiI6IjE2MzAwOTQ5MTEuOTQzMTg2IiwiZXhwIjoiMTY2MTYzMDkxMS45MDA0MzYiLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.P2GlwXSWFZTeIbOAqSiXg5ioxjGzA5B4kRh7rbA1Qwog_tjkR8OEV7CPgMihuWeN437DcRk-5sq-Mb_PM7LDd7h33ddyzs6_oSlwZqOXCUsUu6dVHHTGmtD3kQw3WVaRyZ_Y1poUOaRoUPppUeqJtsRYzRbS1jU_If1nAUHRDGPyleRto8BYiCh1YaMFsowvoyQmWMUl93ngu8njeUC9Ntk8PJ-P-Yoqu823iVioHyBKwxy7D1FDCLBW8e7Pld44Cz7_O3BN7wcIc2N4fOF142jOt9r2V4hlSZq-J9PnmenCNuckcaREekwvvBvGMLCr757oY2X0aapJhn2xfgCjKKvkBgZS3Rzhe8qgrr3JpUkH9lH6pBpp77MwnETXvmu3NaDrvl-SOToOZTNX1EP-FpqDgscKT8GWVTtXedrqwkNpe7e3I0jW7n98fvoPIrkawro-qpflvh6n0njlWPtmPmwkUKbojgrTAO93_6f0neO1MzlKeOLkzMM1wKd2xM3miYH9l6YOaM8JcP98yRgLPsbTPY7SWHStsKV_-GThS5m3t1hUXGTw6DQZ_xfDvYt_iOES40DFrxvdzPycI8pBy18WJ06G_hKatPt2B7F4g63aalsNJ2jaR_NMRL4_UjW9xZMfi2Qb1eShtdkvyrHZ-MSqyVuZfeszggTGhNzEebw"
    });
    return response;
  }
}
