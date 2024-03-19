enum Flavor { prod, dev, staging }

class AppConfig {
  static AppConfig shared = AppConfig.create();

  String appName = "";
  String baseUrl = "";
  Flavor flavor = Flavor.dev;
  AppConfig(this.appName, this.baseUrl, this.flavor);

  factory AppConfig.create({
    String appName = "",
    String baseUrl = "",
    Flavor flavor = Flavor.dev,
  }) {
    return shared = AppConfig(appName, baseUrl, flavor);
  }
}
