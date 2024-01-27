import 'package:internshala_assignment/http/http_client.dart';

class Tapidata{
  static  Map<String,dynamic> mp = {'status' : 200};
  static Future<void> datagetter()  async {
    Map<String,dynamic> map = await THttpHelper.get('search');
    mp =  map;
  }
}