<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sản Phẩm</title>
    <!-- Đường dẫn nhúng CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
</head>
<body>

<div class="container">
    <h1>Danh Sách CD / Sản Phẩm</h1>

    <table>
        <thead>
            <tr>
                <th>Mô Tả Sản Phẩm</th>
                <th style="width: 120px; text-align: right;">Giá</th>
                <th style="width: 160px; text-align: center;">Thao Tác</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>86 (the band)</strong> - True Life Songs and Pictures</td>
                <td style="text-align: right; font-weight: 600; color: #059669;">$14.95</td>
                <td style="text-align: center;">
                    <form action="cart" method="post" style="margin:0;">
                        <input type="hidden" name="productCode" value="8601">
                        <button type="submit" class="btn">Thêm Vào Giỏ</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td><strong>Paddlefoot</strong> - The first CD</td>
                <td style="text-align: right; font-weight: 600; color: #059669;">$12.95</td>
                <td style="text-align: center;">
                    <form action="cart" method="post" style="margin:0;">
                        <input type="hidden" name="productCode" value="pf01">
                        <button type="submit" class="btn">Thêm Vào Giỏ</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td><strong>Joe Rut</strong> - Genuine Wood Grained Finish</td>
                <td style="text-align: right; font-weight: 600; color: #059669;">$14.95</td>
                <td style="text-align: center;">
                    <form action="cart" method="post" style="margin:0;">
                        <input type="hidden" name="productCode" value="jr01">
                        <button type="submit" class="btn">Thêm Vào Giỏ</button>
                    </form>
                </td>
            </tr>
        </tbody>
    </table>

    <div class="action-bar" style="justify-content: flex-end;">
        <a href="cart" class="btn btn-checkout">Xem Giỏ Hàng</a>
    </div>
</div>

</body>
</html>