<?php

require_once('lib/Stripe.php');

if ($_POST) {
  Stripe::setApiKey("api_key");
  try {
  // Use Stripe's bindings...
} catch(Stripe_CardError $e) {
  // Since it's a decline, Stripe_CardError will be caught
  $body = $e->getJsonBody();
  $err  = $body['error'];
 
  $msg = NULL;
  switch($err['code']) {
    case "incorrect_number":
      $msg = "Your card number doesn't look valid. Try typing it again";
    case "expired_card":
      $msg = "Unfortunately, it looks like your card has expired.";
      break;
    // More case statements for the error codes mentioned at
    // https://stripe.com/docs/api?lang=php#catching_errors
    default:
      $msg = "Something went wrong. You should try again or contact support.";
      break;
  }
} catch (Stripe_InvalidRequestError $e) {
  // You could do the same with other error messages...
  // Though you would not have access to $err['code'], as that
  // is only for `Stripe_CardError`s
}
 
// get the credit card details submitted by the form
$email = $_POST['email'];
$users = $_POST['qty'];
 
// create a Customer
$customer = Stripe_Customer::create(array(
  "email" => "$email",
  "description" => "$users")
);

header("Location: http://krooe.com/thankyou.html");

}

?>
