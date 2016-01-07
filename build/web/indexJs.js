function validateRegisterForm(){
    var email = document.forms["registerForm"]["email"].value;
    var reEmail = document.forms["registerForm"]["reEmail"].value;
    if(email !== reEmail){
        alert("emails do not match!");
        return false;
    }
}
