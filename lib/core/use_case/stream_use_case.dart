abstract class StreamUseCase<T, P> {
  Stream<T> call(P params);
}
