// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var selectedCategories = [];

function changeBackgroundColorCategory(category_id) {
    var index = selectedCategories.indexOf(category_id);

    if (index != -1) {
        selectedCategories.splice(index, 1);

        document.getElementById("categoria-img-".concat(category_id)).style.backgroundColor = "transparent";
    } else {
        selectedCategories.push(category_id);

        document.getElementById("categoria-img-".concat(category_id)).style.backgroundColor = "#d1d1d1";
        document.getElementById("categoria-img-".concat(category_id)).style.borderRadius = "10px";
    }

    // Setando Hidden Field para receber as categorias selecionadas
    document.getElementById("form_signature_selected_categories").value = selectedCategories
}

function updatePrice() {
    var peridiocityIndex = document.getElementById("form_signature_peridiocity").selectedIndex;
    var quantityIndex = document.getElementById("form_signature_quantity").selectedIndex;
    var periodIndex = document.getElementById("form_signature_period").selectedIndex;

    if (peridiocityIndex != 0 && quantityIndex != 0 && periodIndex != 0) {
        var resultedPrice = calculatePrice(peridiocityIndex, quantityIndex, periodIndex);

        document.getElementById("resultedValue").innerHTML = resultedPrice.toFixed(2);
        document.getElementById("form_signature_resulted_value").value = resultedPrice.toFixed(2);
    }
}

function calculatePrice(peridiocityIndex, quantityIndex, periodIndex) {
    var price = 0;

    price += quantityIndex * 20;
    price += price/peridiocityIndex;
    price = periodIndex * price * 0.9 * 12;

    return price;
}

function goToByScroll(id){
    $('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
}

function validateUserUpdate(){
    var nome = document.getElementById('nome').value;
    var CPF = document.getElementById('cpf').value;
    

    if (nome == "")
    {
        alert("Existem campos vazios!");
        return false;
    }

    if (!validaCPF(CPF))
    {
        alert("CPF inválido!");
        return false;
    }

    return true;
}

function validateAddressUpdate(){

    var pais = document.getElementById('pais').value;
    var CEP = document.getElementById('cep').value;
    var cidade = document.getElementById('cidade').value;
    var estado = document.getElementById('uf').value;
    var bairro = document.getElementById('bairro').value;
    var rua = document.getElementById('rua').value;
        
    if (pais == "" || estado == "" || cidade == "" || bairro == "" || rua == "")
    {
        alert("Existem campos vazios!");
        return false;
    }
    
    var objER = /^[0-9]{5}-[0-9]{3}$/;

    if (!objER.test(CEP))
    {
        alert("CEP inválido!");
        return false;
    }

    return true;
}

function validateUser(){
    var nome = document.getElementById('nome').value;
    var CPF = document.getElementById('cpf').value;
    var pais = document.getElementById('pais').value;
    var CEP = document.getElementById('cep').value;
    var cidade = document.getElementById('cidade').value;
    var estado = document.getElementById('uf').value;
    var bairro = document.getElementById('bairro').value;
    var rua = document.getElementById('rua').value;
    var email = document.getElementById('email').value;
    var senha = document.getElementById('senha').value;
    var conf_senha = document.getElementById('conf_senha').value;

    if (nome == "" || pais == "" || estado == "" || cidade == "" || bairro == "" || rua == "" || senha == "")
    {
        alert("Existem campos vazios!");
        return false;
    }

    if (!validaCPF(CPF))
    {
        alert("CPF inválido!");
        return false;
    }

    var objER = /^[0-9]{5}-[0-9]{3}$/;

    if (!objER.test(CEP))
    {
        alert("CEP inválido!");
        return false;
    }

    if (!validaEmail(email))
    {
        alert("E-mail inválido!");
        return false;        
    }

    if (!(senha == conf_senha))
    {
        alert("Senhas não batem!");
        return false;
    }

    return true;
}

/* VALIDA CPF */
function validaCPF(cpf) {
    var  testa = /^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$/;

    if (!testa.test(cpf))
        return false;

    cpf = cpf.replace(/[^\d]+/g,'');    
    if(cpf == '') return false; 
    // Elimina CPFs invalidos conhecidos    
    if (cpf.length != 11 || 
        cpf == "00000000000" || 
        cpf == "11111111111" || 
        cpf == "22222222222" || 
        cpf == "33333333333" || 
        cpf == "44444444444" || 
        cpf == "55555555555" || 
        cpf == "66666666666" || 
        cpf == "77777777777" || 
        cpf == "88888888888" || 
        cpf == "99999999999")
            return false;       
    // Valida 1o digito 
    add = 0;    
    for (i=0; i < 9; i ++)       
        add += parseInt(cpf.charAt(i)) * (10 - i);  
        rev = 11 - (add % 11);  
        if (rev == 10 || rev == 11)     
            rev = 0;    
        if (rev != parseInt(cpf.charAt(9)))     
            return false;       
    // Valida 2o digito 
    add = 0;    
    for (i = 0; i < 10; i ++)        
        add += parseInt(cpf.charAt(i)) * (11 - i);  
    rev = 11 - (add % 11);  
    if (rev == 10 || rev == 11) 
        rev = 0;    
    if (rev != parseInt(cpf.charAt(10)))
        return false;       
    return true;   
}

/* VALIDA E-MAIL */
function validaEmail(email){

    atpos = email.indexOf("@");
    dotpos = email.lastIndexOf(".");
         
    return !(atpos < 1 || ( dotpos - atpos < 2 ));
}

/* VALIDA CEP */

function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('rua').value=("");
            document.getElementById('bairro').value=("");
            document.getElementById('cidade').value=("");
            document.getElementById('uf').value=("");
}

function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('rua').value=(conteudo.logradouro);
            document.getElementById('bairro').value=(conteudo.bairro);
            document.getElementById('cidade').value=(conteudo.localidade);
            document.getElementById('uf').value=(conteudo.uf);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();            
        }
}
        
function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('rua').value="...";
                document.getElementById('bairro').value="...";
                document.getElementById('cidade').value="...";
                document.getElementById('uf').value="...";                

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = '//viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();                
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
}
