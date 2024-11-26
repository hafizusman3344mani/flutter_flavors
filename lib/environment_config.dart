enum AppEnv { dev, prod, local }

abstract class Environment {
  final String name;
  final String baseUrl;
  final String resourceUrl;

  Environment({
    required this.name,
    required this.baseUrl,
    required this.resourceUrl,
  });

  factory Environment.fromEnv(AppEnv env) {
    switch (env) {
      case AppEnv.dev:
        return DevEnvironment();

      case AppEnv.prod:
        return ProdEnvironment();

      case AppEnv.local:
        return LocalEnvironment();

      default:
        return LocalEnvironment();
    }
  }
}

class DevEnvironment extends Environment {
  DevEnvironment({
    super.name = 'Development',
    super.baseUrl = 'dev_base_url',
    super.resourceUrl = 'dev_source_url',
  });
}

class ProdEnvironment extends Environment {
  ProdEnvironment({
    super.name = 'Production',
    super.baseUrl = 'prod_base_url',
    super.resourceUrl = 'prod_source_url',
  });
}

class LocalEnvironment extends Environment {
  LocalEnvironment({
    super.name = 'Local',
    super.baseUrl = 'local_base_url',
    super.resourceUrl = 'local_source_url',
  });
}
