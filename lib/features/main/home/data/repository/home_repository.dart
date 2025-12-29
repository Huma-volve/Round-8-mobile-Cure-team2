import 'package:cure_team_2/core/error/exceptions.dart';
import 'package:cure_team_2/core/extensions/app_exception.dart';
import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/core/network/api_constants.dart';
import 'package:cure_team_2/core/network/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepository{
  final ApiService _service;
  HomeRepository(this._service);



  Future<Either<AppException, List<SpecialistsModel>>> getSpecialists()async{
    try{
      final response  = await _service.baseGET(endPoint: ApiEndPoints.specialists) ;
      final List<SpecialistsModel> specialists = (response['data']['specialties']as List ).map((e)=> SpecialistsModel.fromJson(e)).toList() ;
      return right(specialists) ;
    }catch(e){
      return left(e.toAppException) ;
    }
  }



}