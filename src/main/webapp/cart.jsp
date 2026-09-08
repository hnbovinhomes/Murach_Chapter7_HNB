<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="murach.business.Cart, murach.business.LineItem, java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng Của Bạn</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
</head>
<body>

<div class="container">
    <h1>Giỏ Hàng Của Bạn</h1>

    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
    %>
        <div class="empty-message">
            <p>Giỏ hàng của bạn đang trống.</p>
        </div>
    <%
        } else {
            List<LineItem> items = cart.getItems();
    %>
    <table>
        <thead>
            <tr>
                <th>Số Lượng</th>
                <th>Mô Tả Sản Phẩm</th>
                <th style="text-align: right;">Đơn Giá</th>
                <th style="text-align: right;">Thành Tiền</th>
                <th style="text-align: center;">Thao Tác</th>
            </tr>
        </thead>
        <tbody>
            <% for (LineItem item : items) { %>
            <tr>
                <td style="width: 140px;">
                    <form action="cart" method="post" style="display: flex; gap: 6px; align-items: center;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1">
                        <button type="submit" class="btn" style="padding: 5px 10px; font-size: 12px;">Cập nhật</button>
                    </form>
                </td>
                <td><strong><%= item.getProduct().getDescription() %></strong></td>
                <td style="text-align: right;">$<%= String.format("%.2f", item.getProduct().getPrice()) %></td>
                <td style="text-align: right; font-weight: 600; color: #059669;">$<%= String.format("%.2f", item.getTotal()) %></td>
                <td style="text-align: center;">
                    <form action="cart" method="post" style="margin:0;">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>

    <div class="action-bar">
        <a href="cart?action=shop" class="btn">Tiếp Tục Mua Sắm</a>
        <a href="#" class="btn btn-checkout">Thanh Toán</a>
    </div>
</div>

</body>
</html>