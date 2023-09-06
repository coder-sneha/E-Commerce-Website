//
//package com.ecommerce.onlinestore.payment;
//
//import com.stripe.Stripe;
//import com.stripe.exception.StripeException;
//import com.stripe.model.PaymentIntent;
//import com.stripe.param.PaymentIntentCreateParams;
//
//
//public class PaymentService {
//     public String createPaymentIntent(long amount, String currency) throws StripeException {
//        Stripe.apiKey = StripeConfig.SECRET_KEY;
//
//        PaymentIntentCreateParams params = PaymentIntentCreateParams.builder()
//                .setAmount(amount)
//                .setCurrency(currency)
//                .build();
//
//        PaymentIntent paymentIntent = PaymentIntent.create(params);
//        return paymentIntent.getClientSecret();
//     }
//}
