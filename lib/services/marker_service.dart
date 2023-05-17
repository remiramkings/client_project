import 'package:client_project/models/marker_data.dart';

class MarkerService {
  static List<MarkerData> getAllMarkers() {
    return [
      MarkerData(
          name: 'client1', lat: 10.193840305017455, long: 76.38330387548555),
      MarkerData(
          name: 'client2', lat: 10.113497523992915, long: 76.33878327962915),
      MarkerData(
          name: 'client3', lat: 9.867475668215544, long: 76.49460537057797),
      MarkerData(
          name: 'client4', lat: 10.54540377028403, long: 76.2175883331008),
      MarkerData(
          name: 'client5', lat: 9.583469877633751, long: 76.51068226433996),
      MarkerData(
          name: 'client6', lat: 10.648449112648667, long: 76.2422371803081),
      MarkerData(
          name: 'client7', lat: 9.898471527619396, long: 76.72227748796712),
      MarkerData(
          name: 'client8', lat: 10.776037918179263, long: 76.3683788685679)
    ];
  }
}
