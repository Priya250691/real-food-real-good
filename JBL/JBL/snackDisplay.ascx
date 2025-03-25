<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="snackDisplay.ascx.cs" Inherits="JayBhavaniLocho.snackDisplay" %>

<%--<asp:HiddenField ID="hfSnackId" runat="server" />--%>
<asp:HiddenField ID="hfSnackId" runat="server" />
<asp:HiddenField ID="hfImage" runat="server" Value='<%# Eval("image") %>' />
<asp:HiddenField ID="hfSnackName" runat="server" Value='<%# Eval("snackName") %>' />
<asp:HiddenField ID="hfDescription" runat="server" Value='<%# Eval("description") %>' />
<asp:HiddenField ID="hfPrice" runat="server" Value='<%# Eval("price") %>' />


<div class="col-md-4">
    <div class="card mb-4 box-shadow">
        <img class="card-img-top" src='<%# Eval("image") %>' alt='<%# Eval("snackName") %>' style="height: 300px;">
        <div class="card-body">
            <div class="mb-2">
                <span class="card-label fw-bold">Name:</span>
                <span class="card-value"><%# Eval("snackName") %></span>
            </div>
            <div class="mb-2 card-description">
                <span class="card-label fw-bold">Description:</span>
                <span class="card-value"><%# Eval("description") %></span>
            </div>
            <div class="mb-2">
                <span class="card-label fw-bold">Price:</span>
                <span class="card-value"><%# Eval("price") %></span>
            </div>
            <div class="d-flex mt-auto">
                <button type="button" class="btn btn-primary me-2" onclick="decrementQuantity(this)">-</button>
                <input type="text" class="form-control me-2" id="quantity_<%# Eval("snackId") %>" value="1" readonly />
                <button type="button" class="btn btn-primary me-2" onclick="incrementQuantity(this)">+</button>
                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" />
            </div>
        </div>
    </div>
</div>

<script>
    function incrementQuantity(button) {
        var quantityInput = button.parentNode.querySelector('input');
        var currentQuantity = parseInt(quantityInput.value, 10);
        quantityInput.value = currentQuantity + 1;
    }

    function decrementQuantity(button) {
        var quantityInput = button.parentNode.querySelector('input');
        var currentQuantity = parseInt(quantityInput.value, 10);

        // Ensure quantity doesn't go below 1
        if (currentQuantity > 1) {
            quantityInput.value = currentQuantity - 1;
        }
    }
</script>






<style>
    .card {
        width: 400px; /* Set your desired width */
        border: 1px solid #e0e0e0;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card-img-top {
        object-fit: cover;
        height: 200px;
    }

    .card-body {
        padding: 20px;
        display: flex;
        flex-direction: column;
    }

    .card-label {
        font-weight: bold;
        color: #333;
        font-size: 16px;
        margin-bottom: 4px;
    }

    .card-value {
        color: #555;
        font-size: 14px;
        margin-bottom: 12px;
    }

    .card-description {
        flex-grow: 1;
        color: #777;
        font-size: 14px;
        margin-bottom: 12px;
    }

    #btnAddToCart {
        margin-top: 10px;
        
    }


    .quantity-controls {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .quantity-button {
        background-color: #4caf50;
        color: white;
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin: 0 5px;
    }

    .quantity-textbox {
        width: 30px;
        text-align: center;
    }
</style>

