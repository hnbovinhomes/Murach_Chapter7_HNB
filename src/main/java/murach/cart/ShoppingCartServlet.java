package murach.cart;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet; // <-- Thêm import này
import jakarta.servlet.http.*;
import murach.business.*;

@WebServlet("/cart") // <-- CỰC KỲ QUAN TRỌNG: Khai báo đường dẫn URL /cart tại đây
public class ShoppingCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext sc = getServletContext();
        String action = request.getParameter("action");
        if (action == null) {
            action = "cart";
        }

        String url = "/index.jsp";

        if (action.equals("shop")) {
            url = "/index.jsp";
        }
        else if (action.equals("cart")) {
            String productCode = request.getParameter("productCode");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
                if (quantity < 0) quantity = 1;
            } catch (NumberFormatException nfe) {
                quantity = 1;
            }

            Product product = new Product();
            if ("8601".equals(productCode)) {
                product.setCode("8601");
                product.setDescription("86 (the band) - True Life Songs and Pictures");
                product.setPrice(14.95);
            } else if ("pf01".equals(productCode)) {
                product.setCode("pf01");
                product.setDescription("Paddlefoot - The first CD");
                product.setPrice(12.95);
            } else if ("jr01".equals(productCode)) {
                product.setCode("jr01");
                product.setDescription("Joe Rut - Genuine Wood Grained Finish");
                product.setPrice(14.95);
            } else {
                product.setCode(productCode);
                product.setDescription("Sản phẩm " + productCode);
                product.setPrice(14.95);
            }

            LineItem lineItem = new LineItem();
            lineItem.setProduct(product);
            lineItem.setQuantity(quantity);

            if (quantity > 0) {
                cart.addItem(lineItem);
            } else {
                cart.removeItem(lineItem);
            }

            session.setAttribute("cart", cart);
            url = "/cart.jsp";
        }
        else if (action.equals("remove")) {
            String productCode = request.getParameter("productCode");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");

            if (cart != null && productCode != null) {
                LineItem itemToRemove = null;
                for (LineItem item : cart.getItems()) {
                    if (item.getProduct().getCode().equalsIgnoreCase(productCode)) {
                        itemToRemove = item;
                        break;
                    }
                }
                if (itemToRemove != null) {
                    cart.removeItem(itemToRemove);
                }
            }
            session.setAttribute("cart", cart);
            url = "/cart.jsp";
        }
        else if (action.equals("update")) {
            String productCode = request.getParameter("productCode");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");

            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
            } catch (NumberFormatException e) {
                quantity = 1;
            }

            if (cart != null && productCode != null) {
                LineItem itemToUpdate = null;
                for (LineItem item : cart.getItems()) {
                    if (item.getProduct().getCode().equalsIgnoreCase(productCode)) {
                        itemToUpdate = item;
                        break;
                    }
                }

                if (itemToUpdate != null) {
                    if (quantity > 0) {
                        itemToUpdate.setQuantity(quantity);
                    } else {
                        cart.removeItem(itemToUpdate);
                    }
                }
            }
            session.setAttribute("cart", cart);
            url = "/cart.jsp";
        }

        sc.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}