class InputValidation{
  static bool isNameValid(String name){
            String pattern=r'^[a-z A-Z,.\-]+$';
            RegExp regExp=RegExp(pattern);
            if(name.isEmpty){
              return false;
            }
            else if(!regExp.hasMatch(name)){
              return false;
            }
            else{
              return true;
            }

  }
  static bool isEmailValid(String email){
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp=RegExp(pattern);
  if(email.isEmpty){
    return false;
  }
  else if(!regExp.hasMatch(email)){
    return false;
  }
  else{
    return true;
  }
  }
  
}