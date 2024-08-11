import 'package:fly_on/constants/api_paths.dart';
import 'package:get/get.dart';
import 'package:fly_on/helper/api.dart';


class FacilityDetailsService {

  Future<Response> facilityDetails(String facilityId) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.facilityDetailsUrl,body: {"id" : facilityId});
  }

  Future<Response> addRate(String facilityId,String rate) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.addRateUrl,body: {"facility_id" : facilityId,"rate": rate});
  }

  Future<Response> deleteRate(String rateId) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.addRateUrl,body: {"id" : rateId});
  }

  Future<Response> updateRate(String rateId,String rate) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.addRateUrl,body: {"id" : rateId,"rate" : rate});
  }

}