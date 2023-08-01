abstract class newstates {}
class intialstate extends newstates {}
class bottomvavigator extends newstates {}

class newsbussinceloadingstate extends newstates {}
class newsbussincesuccessedstate extends newstates {}
class newsbussincefailstate extends newstates {
  String? error;
  newsbussincefailstate(this.error);
}

class newssportsloadingstate extends newstates {}
class newssportssuccessedstate extends newstates {}
class newssportsfailstate extends newstates {
  String? error;
  newssportsfailstate(this.error);
}

class newsscinceloadingstate extends newstates {}
class newsscincesuccessedstate extends newstates {}
class newsscincefailstate extends newstates {
  String? error;
  newsscincefailstate(this.error);
}

class newsappmodestate extends newstates {}

class newssearchloadingstate extends newstates {}
class newssearchsuccessedstate extends newstates {}
class newssearchfailstate extends newstates {
  String? error;
  newssearchfailstate(this.error);
}
