package laptop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import laptop.management.dao.LaptopDAO;
import laptop.model.item;
import laptop.model.order;
import laptop.model.payment;
import laptop.model.product_payment;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LaptopDAO laptopDAO;

	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		laptopDAO = new LaptopDAO();

	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		order order = (order) session.getAttribute("order");
		List<item> listItem = new ArrayList();
		if (order != null) {
			listItem = order.getListItem();
		}
		Locale locale = new Locale("vi", "VN");
		NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
		payment payment = new payment();
		payment.setAddress(request.getParameter("address"));
		payment.setName(request.getParameter("name"));
		payment.setPhone(request.getParameter("phone"));
		payment.setStatus("UNPAID");
		payment.setTotal(Integer.parseInt(request.getParameter("total")));
		try {
			laptopDAO.insertPayment(payment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int paymentId = laptopDAO.selectMaxId();
		for (item item : listItem) {
			int productId = item.getProduct().getId();
			int quantity = item.getQuantity();
			product_payment product_payment = new product_payment();
			product_payment.setPaymentId(paymentId);
			product_payment.setProductId(productId);
			product_payment.setQuantity(quantity);
			try {
				laptopDAO.insertOrder(product_payment);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		session.setAttribute("order", null);
		request.setAttribute("message", "Đặt hàng thành công");
		RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
		dispatcher.forward(request, response);
	}

}
