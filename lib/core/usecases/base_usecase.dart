// This is the base use case class which will be extended by all the use cases.
abstract class BaseUseCase<T, Params> {
  Future<T> call(Params params);
  const BaseUseCase();
}