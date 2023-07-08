
// To check that user inputed same password twice
function passwordMatch() {
    var userPassword = document.getElementById("userPassword");
    var confirmPassword = document.getElementById("confirmPassword");
    var registerButton = document.getElementById("registerButton");
    var passwordHelp = document.getElementById("passwordHelp");
    console.log("Function run");
    if (userPassword.value != confirmPassword.value) {
        passwordHelp.innerText = "Passwords do not match";
        registerButton.disabled = true;
    } else {
        passwordHelp.innerText = "";
        registerButton.disabled = false;
    }
}

function addToCart(pId, pName, pPrice) {
    let cart = localStorage.getItem("cart");

    // Check if cart is empty or cart is not creatd yet yet
    if (cart == null || cart == "") {
        let products = [];
        let product = {
            id: pId,
            name: pName,
            price: pPrice,
            quantity: 1
        };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Cart is created and product is added to cart");
    }
    // If cart is already created
    else {
        // Find is product already exist in cart
        let products = JSON.parse(cart);
        let oldProduct = products.find((product) => product.id == pId);
        if (oldProduct) {
            oldProduct.quantity = oldProduct.quantity + 1;

            // Update product quantity in cart
            products.map((product) => {
                if (product.id == oldProduct.id) {
                    product.quantity = oldProduct.quantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(products));
            console.log("Product quantity is updated");
        }
        // If product not exist in cart
        else {
            let product = {
                id: pId,
                name: pName,
                price: pPrice,
                quantity: 1
            };
            products.push(product);
            localStorage.setItem("cart", JSON.stringify(products));
            console.log("Product is added to cart");
        }
    }

    updateCart();

}


// Update cart
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let products = JSON.parse(cartString);
    if (products == null || products.length == 0) {
        console.log("Cart is empty");
        $(".cart-body").html("<h3>Cart is empty</h3>");
        $("#noOfCartItems").html(`(${0})`);
        $("#checkoutBtn").prop("disabled", true);
    } else {
        // $(".cart-body").html("<h3>Cart is not empty</h3>");
        $("#noOfCartItems").html(`(${products.length})`);
        $("#checkoutBtn").prop("disabled", false);

        let table = `<table class="table">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Product Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total Price</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        
    `;
        let totalPrice = 0;
        products.forEach((product) => {
            table = table + `
            <tr>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.quantity * product.price}</td>
                <td><button class="btn btn-danger" onclick="removeFromCart(${product.id})">Remove</button></td>
            </tr>`;
            totalPrice += product.quantity * product.price;
        })

        // To print total price in the table at the last row
        table = table + `<tr rowspan = 2  style="text-align: right; font-weight: bold"><td colspan="5">Total price:- ${totalPrice}</td></tr>`
        table = table + `</table > `;
        $(".cart-body").html(table);
    }
}

function removeFromCart(id) {
    let products = JSON.parse(localStorage.getItem("cart"));
    // filter will store all products except the product with id that is passed by argument
    products = products.filter((product) => product.id != id);
    localStorage.setItem("cart", JSON.stringify(products));
    updateCart();

    showToast("Product removed from cart");
}

// To show the toast message
function showToast(message) {
    // Create a toast element
    var toast = document.createElement("div");
    toast.classList.add("toast");
    toast.textContent = message;

    // Append the toast element to the body
    document.body.appendChild(toast);

    // Set a timeout to remove the toast after 3 seconds
    setTimeout(function () {
        toast.remove();
    }, 3000);
}

// After checkout
function order() {
    // Clear cart
    localStorage.removeItem("cart");
    updateCart();
}

// Usage:
showToast("Hello, world!");


$(document).ready(function () {
    updateCart();
})