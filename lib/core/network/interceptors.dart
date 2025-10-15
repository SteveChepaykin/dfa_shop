import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final options = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  hitCacheOnErrorCodes: [500],
  hitCacheOnNetworkFailure: true,
  maxStale: Duration(days: 1),
  priority: CachePriority.normal,
  cipher: null,
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  allowPostMethod: false,
);