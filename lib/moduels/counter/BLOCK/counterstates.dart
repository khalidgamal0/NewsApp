abstract class countrestates{}
class initialstate extends countrestates {}
class plusstate extends countrestates
{
  final int counter;
  plusstate(this.counter);
}
class mincestate extends countrestates
{
  final int counter;
  mincestate(this.counter);
}