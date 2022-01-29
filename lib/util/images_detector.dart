
class ImagesDetector {
  final String imageName;
  static List<String> images = [
    "01d@2x.png",
    "02d@2x.png",
    "03d@2x.png",
    "04d@2x.png",
    "09d@2x.png",
    "10d@2x.png",
    "11d@2x.png",
    "13d@2x.png",
    "50d@2x.png",
    "01n@2x.png",
    "02n@2x.png",
    "03n@2x.png",
    "04n@2x.png",
    "09n@2x.png",
    "10n@2x.png",
    "11n@2x.png",
    "13n@2x.png",
    "50n@2x.png",
  ];
  ImagesDetector(this.imageName);

  static String findImageByIconName(String iconName) {
    String _imageName = "";
    for(final image in images) {
      if(image.substring(0, 3) == iconName) {
        _imageName = image;
      }
    }
    print('Получена картинка погоды - ' + _imageName);
    return _imageName;
  }
}