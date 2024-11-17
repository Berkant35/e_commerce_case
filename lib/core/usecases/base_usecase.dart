abstract class BaseUseCase<T, Params> {
  Future<T> call(Params params);
  const BaseUseCase();

}