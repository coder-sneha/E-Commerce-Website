function add_to_cart(pid, pname, price){
    
    let cart = localStorage.getItem("cart");
    if(cart === null){
        //no cart yet
        let products =[];
        let product ={
            productId : pid, productName : pname, productQuantity: 1, productPrice : price
        };
        
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        showToast("Item is added to cart");
        
//        console.log("first time add");
        
        
    }else{
      //cart is alrady present
      
      let pcart = JSON.parse(cart);
      
      let oldProduct = pcart.find((item) => item.productId === pid);
      console.log("old product");
      if(oldProduct){
          
          oldProduct.productQuantity = oldProduct.productQuantity+1;
          pcart.map((item) => {
              if(item.productId === oldProduct.productId){
                  item.productQuantity = oldProduct.productQuantity;
              }
              
          });
            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("quantity increase");
             showToast("Item Quantity is increased");
          
      }else{
           let product ={
            productId : pid, productName : pname, productQuantity: 1, productPrice : price
        };
        pcart.push(product);
        localStorage.setItem("cart", JSON.stringify(pcart));
//        console.log("product add");
 showToast("Item is added to cart");
        
      }        
  }
  
  updateCart();
    }

//cart function

function updateCart(){
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    
    
    if(cart=== null || cart.length===0){ 
        console.log("cart is empty !!");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h5>Cart does not have any items </h5>");
        $(".checkout-btn").attr('disabled',true);
        
    }else{
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        
        let table=`
            <table class ='table'>
            <thead class='thead-light'>
            <tr>
        <th>Item Name </th>
        <th>Price </th>
        <th>Quantity </th>
        <th>Total Price </th>
        <th> Action</th>
        
   
        </tr>    
           </thead>
`;
        
        let totalPrice =0;
        cart.map((item)=>{
            
            table +=`
            <tr>
                   <td> ${item.productName} </td>
                   <td> ${item.productPrice} </td>
                   <td>
            <button onclick='decrementItem(${item.productId})' class='btn btn-secondary btn-sm'>-</button>
            ${item.productQuantity}
            <button onclick='incrementItem(${item.productId})' class='btn btn-secondary btn-sm'>+</button>
          </td>
                   <td> ${item.productQuantity* item.productPrice} </td>
                   <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'> Remove </button> </td>  
            </tr>
           
`;
           totalPrice += item.productPrice * item.productQuantity; 
        });
        
        
        table = table + `
                   <tr><td colspan='5' class='text-right'> <h5> Total Price : ${totalPrice} </h5> </td></td> 
                </table>`;
        
                $(".cart-body").html(table);
                $(".checkout-btn").attr('disabled',false);
        
    }
}

//delete item
function deleteItemFromCart(pid){
    let cart= JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item) => item.productId !== pid);
    
    localStorage.setItem('cart', JSON.stringify(newcart));
    
     updateCart();
     
      showToast("Item is remove from cart");
}

// Increment item quantity
function incrementItem(pid) {
  let cart = JSON.parse(localStorage.getItem("cart"));

  let product = cart.find((item) => item.productId === pid);
  if (product) {
    product.productQuantity += 1;
    localStorage.setItem("cart", JSON.stringify(cart));
    console.log("quantity incremented");
    updateCart();
  }
}

// Decrement item quantity
function decrementItem(pid) {
  let cart = JSON.parse(localStorage.getItem("cart"));

  let productIndex = cart.findIndex((item) => item.productId === pid);
  if (productIndex > -1) {
    cart[productIndex].productQuantity -= 1;
    if (cart[productIndex].productQuantity < 1) {
      cart.splice(productIndex, 1); // Remove the item from the cart
    }
    localStorage.setItem("cart", JSON.stringify(cart));
    console.log("quantity decremented");
    updateCart();
  }
}


$(document).ready(function(){
    updateCart();
});

//for toast
function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
            $("#toast").removeClass("display");

    },2000);
}

//function goToCheckout(){
//    window.location = "checkout.jsp";
//}


//payment integration


//document.getElementById('paymentButton').addEventListener('click', function() {
//    // Make an AJAX request to your server to create the payment intent
//   var xhr = new XMLHttpRequest();
//xhr.open('POST', '/createPaymentIntent', true);
//xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//xhr.onreadystatechange = function() {
//    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
//        var clientSecret = xhr.responseText;
//        // Call the function to complete the payment process using Stripe.js
//        handlePayment(clientSecret);
//    }
//};
//xhr.send();
//
//});
//
//function handlePayment(clientSecret) {
//    // Use the client secret to complete the payment process using Stripe.js
//    var stripe = Stripe('pk_test_51MGjhhSDccKyThMEC4E0NpIP05H42LNaRag2eif5CHq0jw9q1AhDtzb8BhJZeL0LteJZviBWNApn3IxDekE0p89u00f4yQpmuc');
//    stripe.confirmCardPayment(clientSecret, {
//        payment_method: {
//            card: {
//                // Provide card details
//            }
//        }
//    }).then(function(result) {
//        if (result.error) {
//            // Handle payment error
//        } else {
//            // Payment successful
//        }
//    });
//}
