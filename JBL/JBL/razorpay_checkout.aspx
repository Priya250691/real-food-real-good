<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="razorpay_checkout.aspx.cs" Inherits="JayBhavaniLocho.razorpay_checkout" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Razorpay Checkout</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Razorpay Checkout Form -->
            <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
            <%--<script>
                // Define the Razorpay options
                var options = {
                    key: '<%= RazorpayApiKey %>', // Replace with your Razorpay key
                    amount: '<%= Request.QueryString["amount"] %>', // Amount in paisa
                    currency: 'INR',
                    name: 'Jay Bhavani Locho',
                    description: 'Delicious Food',
                    order_id: '<%= Request.QueryString["orderId"] %>',
                    handler: function (response) {
                        // Handle successful payment response
                        alert('Payment successful! Payment ID: ' + response.razorpay_payment_id);
                        console.log('Payment successful! Payment ID: ' + response.razorpay_payment_id);
                        console.log('User ID: <%= Request.QueryString["userId"] %>');
                        console.log('Amount: <%= Request.QueryString["amount"] %>');
                        // Call the server-side method to save payment details
                        savePaymentDetails(response.razorpay_payment_id, '<%= Request.QueryString["userId"] %>', '<%= Request.QueryString["amount"] %>');
                    },
                    prefill: {
                        name: '',
                        email: '',
                        contact: ''
                    },
                    theme: {
                        color: '#F37254'
                    }
                };

                // Initialize Razorpay with the options
                var rzp = new Razorpay(options);

                // Function to save payment details on the server
                function savePaymentDetails(paymentId, userId, amount) {
                    $.ajax({
                        type: 'POST',
                        url: 'razorpay_checkout.aspx/SavePaymentDetails',
                        data: JSON.stringify({ paymentId: paymentId, userId: userId, amount: amount }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d) {
                                // Payment details saved successfully
                                window.location.href = 'menu.aspx';
                            } else {
                                // Failed to save payment details
                                alert('Failed to save payment details in success.');
                            }
                        },
                        error: function (error) {
                            console.log(error);
                            alert('Failed to save payment details.');
                        },
                        complete: function () {
                            // This will execute after success or error
                        }
                    });
                }

                // Open the Razorpay checkout form when the window loads
                window.onload = function () {
                    rzp.open();
                };
            </script>--%>



            <script>
                // Function to get query string parameters by name
                function getParameterByName(name, url) {
                    if (!url) url = window.location.href;
                    name = name.replace(/[\[\]]/g, "\\$&");
                    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                        results = regex.exec(url);
                    if (!results) return null;
                    if (!results[2]) return '';
                    return decodeURIComponent(results[2].replace(/\+/g, " "));
                }

                // Define the Razorpay options
                var options = {
                    key: '<%= RazorpayApiKey %>', // Replace with your Razorpay key
                    amount: getParameterByName('amount'), // Amount in paisa
                    currency: 'INR',
                    name: 'Jay Bhavani Locho',
                    description: 'Delicious Food',
                    order_id: getParameterByName('orderId'),
                    handler: function (response) {
                        // Handle successful payment response
                        alert('Payment successful! Payment ID: ' + response.razorpay_payment_id);
                        console.log('URL: ' + window.location.href);

                        console.log('Payment successful! Payment ID: ' + response.razorpay_payment_id);
                        console.log('User ID: ' + getParameterByName('userId'));
                        console.log('Amount: ' + getParameterByName('amount'));
                        // Call the server-side method to save payment details
                        savePaymentDetails(response.razorpay_payment_id, getParameterByName('userId'), getParameterByName('amount'));
                    },
                    prefill: {
                        name: '',
                        email: '',
                        contact: ''
                    },
                    theme: {
                        color: '#F37254'
                    }
                };

                // Initialize Razorpay with the options
                var rzp = new Razorpay(options);

                // Function to save payment details on the server
                function savePaymentDetails(paymentId, userId, amount) {
                    $.ajax({
                        type: 'POST',
                        url: 'razorpay_checkout.aspx/SavePaymentDetails',
                        data: JSON.stringify({ paymentId: paymentId, userId: userId, amount: amount }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d) {
                                // Payment details saved successfully
                                window.location.href = 'menu.aspx';
                            } else {
                                // Failed to save payment details
                                //alert('Failed to save payment details in success.');
                                window.location.href = 'menu.aspx';
                            }
                        },
                        error: function (error) {
                            console.log(error);
                            window.location.href = 'menu.aspx';
                            //alert('Failed to save payment details.');
                        },
                        complete: function () {
                            // This will execute after success or error
                        }
                    });
                }

                // Open the Razorpay checkout form when the window loads
                window.onload = function () {
                    rzp.open();
                };
            </script>

        </div>
    </form>
</body>
</html>


