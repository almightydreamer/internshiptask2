abstract class Failure {}

class ApiFailure implements Failure {
  final dynamic error;
  final StackTrace st;

  const ApiFailure(this.error, this.st);
}
