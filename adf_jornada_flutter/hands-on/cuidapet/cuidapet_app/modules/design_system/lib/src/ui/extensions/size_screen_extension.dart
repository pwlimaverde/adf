
import 'package:dependencies/dependencies.dart';

extension SizeScreenExtension on num{
  double get csw => ScreenUtil().setWidth(this);
  double get csh => ScreenUtil().setHeight(this);
  double get csr => ScreenUtil().radius(this);
  double get cssp => ScreenUtil().setSp(this);
  double get cssw => ScreenUtil().screenWidth * this;
  double get cssh => ScreenUtil().screenHeight * this;
  double get csstatusBarHeight => ScreenUtil().statusBarHeight * this;
  double get csbottomBarHeight => ScreenUtil().bottomBarHeight * this;
}


