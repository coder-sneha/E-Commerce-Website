//
//package com.ecommerce.onlinestore.payment;
//
//import com.stripe.exception.SignatureVerificationException;
//import com.stripe.model.Event;
//import com.stripe.net.Webhook;
//import spark.Request;
//import spark.Response;
//
//
//
//public class WebhookController {
//    
//    public static final String WEBHOOK_SECRET = "YOUR_STRIPE_WEBHOOK_SECRET";
//
//    public String handleWebhook(Request request, Response response) throws SignatureVerificationException {
//        String payload = request.body();
//        String sigHeader = request.headers("Stripe-Signature");
//
//        Event event = Webhook.constructEvent(payload, sigHeader, WEBHOOK_SECRET);
//        // Process the event and update your application accordingly
//
//        response.status(200);
//        return "Webhook received";
//    }
//}
