import 'package:fly_on/constants/api_paths.dart';
import 'package:get/get.dart';
import 'package:fly_on/helper/api.dart';


class CountryService {

  Future<Response> countryDetails(String countryId) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.countryDetailsUrl,body: {"id" : countryId});
  }


}