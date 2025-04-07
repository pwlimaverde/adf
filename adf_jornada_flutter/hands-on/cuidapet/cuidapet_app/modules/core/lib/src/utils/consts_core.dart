
import 'package:dependencies/dependencies.dart';

final class ConstsCore {
  ConstsCore._();
  ///Banco de imagens storage
  static const String refLogoCliente = 'institucional/logo_cliente.png';
  static const String labelLogoCliente = 'Label Logo Cliente';
  static String baseUrl = FeaturesServicePresenter.to.remoteConfigInstance.getString('base_url');
  static int connectTimeoutMilliseconds = FeaturesServicePresenter.to.remoteConfigInstance.getInt('connect_timeout_milliseconds');
  static int receiveTimeoutMilliseconds = FeaturesServicePresenter.to.remoteConfigInstance.getInt('receive_timeout_milliseconds');
}