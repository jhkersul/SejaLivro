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