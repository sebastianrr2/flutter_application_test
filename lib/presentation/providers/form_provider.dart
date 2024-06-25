
part of 'providers.dart';

class FormProvider extends ChangeNotifier {

  /* Se utiliza para hacer referencia a widgets en especifico, se necesita el state que depende del
  widget que se este utilizando, en este caso, los text form fields estan contenido en un Form, por lo
  tanto, el state es FormState */
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPersonalAccount = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyBusinessAccount = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPublicInformation = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyTransferTicket = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRecoverPass = GlobalKey<FormState>();

  String emailLogin = '';
  String passwordLogin = '';

  String emailPersonal = '';
  String fullNamePersonal = '';
  String usernamePersonal = '';
  String passwordPersonal = '';

  String emailBusiness = '';
  String fullNameBusiness = '';
  String usernameBusiness = '';
  String passwordBusiness = '';

  String emailPublic = '';
  String addressPublic = '';
  String contactNumberPublic = '';

  String userTransferTicket = '';
  String recoverPass = '';

  bool _visiblePassword = false;

  bool _isLoading = false;
  

  bool get visiblePassword => _visiblePassword;
  bool get isLoading => _isLoading;

  set visiblePassword(bool value) {
    _visiblePassword = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidFormLogin() {

    // print(formKeyLogin.currentState?.validate());
    
    /* Si el currentState no esta asociado a nada hay que poner ? porque puede ser null, si esta asociado
    va a retornar true or false */
    return formKeyLogin.currentState?.validate() ?? false;
  }

  bool isValidFormPersonal() {

    // print(formKeyLogin.currentState?.validate());
    
    /* Si el currentState no esta asociado a nada hay que poner ? porque puede ser null, si esta asociado
    va a retornar true or false */
    return formKeyPersonalAccount.currentState?.validate() ?? false;
  }

  bool isValidFormBusiness() {

    // print(formKeyLogin.currentState?.validate());
    
    /* Si el currentState no esta asociado a nada hay que poner ? porque puede ser null, si esta asociado
    va a retornar true or false */
    return formKeyBusinessAccount.currentState?.validate() ?? false;
  }

  bool isValidFormPublicInformation() {

    // print(formKeyLogin.currentState?.validate());
    
    /* Si el currentState no esta asociado a nada hay que poner ? porque puede ser null, si esta asociado
    va a retornar true or false */
    return formKeyPublicInformation.currentState?.validate() ?? false;
  }

  bool isValidFormTransferTicket() {
    return formKeyTransferTicket.currentState?.validate() ?? false;
  }

  bool isValidFormRecoverPass() {
    return formKeyRecoverPass.currentState?.validate() ?? false;
  }
}