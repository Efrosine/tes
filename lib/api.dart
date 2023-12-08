import 'package:dio/dio.dart';
import 'package:tes/hotels_model.dart';
import 'package:tes/req_hotels.dart';

class ApiSerrvice {
  final _service = Dio();

  Future<List<HotelsModel>> get() async {
    final response = await _service.get(
      'https://booking-com15.p.rapidapi.com/api/v1/hotels/searchDestination',
      queryParameters: {'query': 'Jakarta Indonesia'},
      options: Options(headers: {
        'X-RapidAPI-Key': '2e7aa97237msh89ce8f771546c47p1fe7acjsn105dde33f0df',
        'X-RapidAPI-Host': 'booking-com15.p.rapidapi.com',
      }),
    );

    final data = response.data['data'][0];

    String destId = data['dest_id'];
    String destType = data['dest_type'];

    print(destId);
    print(destType);

    final listHotels = await _service.get(
      'https://booking-com15.p.rapidapi.com/api/v1/hotels/searchHotels',
      queryParameters: {
        'dest_id': destId,
        'search_type': destType,
        'arrival_date': '2023-12-08',
        'departure_date': '2023-12-10',
      },
      options: Options(headers: {
        'X-RapidAPI-Key': '2e7aa97237msh89ce8f771546c47p1fe7acjsn105dde33f0df',
        'X-RapidAPI-Host': 'booking-com15.p.rapidapi.com',
      }),
    );

    List<HotelsModel> listHot = [];
    final dataHotels = listHotels.data['data']['hotels'] as List<dynamic>;
    dataHotels.forEach((element) {
      var list = HotelsModel.fromJson(element['property']);
      listHot.add(list);
    });

    return listHot;
  }
}
