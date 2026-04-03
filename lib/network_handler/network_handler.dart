
import 'package:dio/dio.dart';
import 'package:movies_app/models/movies_model.dart';

class NetworkHandler {
  static Future<MoviesModel> getAllMovies() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          "https://movies-api.accel.li/api/v2/list_movies.json?quality=3D");
      if(response.statusCode==200){
        return MoviesModel.fromJson(response.data);
      }
      else{
        throw Exception("SomeThing went wrong");
      }
    } catch (error) {
      throw Exception("There is Error");
    }
  }
}
