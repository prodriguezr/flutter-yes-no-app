import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  static final _dio = Dio();

  static Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final YesNoModel yesNoModel = YesNoModel.fromMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
