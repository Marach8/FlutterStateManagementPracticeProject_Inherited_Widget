class FakeApi{
  String? dateAndTime;

  Future<String> getDateAndTime() => Future.delayed(
    const Duration(seconds: 1), () => DateTime.now().toIso8601String())
      .then((result) => dateAndTime = result);
}