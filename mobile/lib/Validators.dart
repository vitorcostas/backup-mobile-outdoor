

emailValidator(String? value){
  if(value == null || value.isEmpty)
    {
    return 'Campo Necessário';
    }
  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
    return 'Colocar um email válido';
    }
  return null;
}


