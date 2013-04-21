Stripe.setPublishableKey = 'pk_live_cFlJXbrzXHso9eTpGikMFAox';

function update_price() {
    var subtotal = $("#id_qty").val() * $("#id_price").val();
    $("#subtotal").text(subtotal.toFixed(2));
}

$(document).ready(function () {
    $("#id_qty").change(update_price);
});