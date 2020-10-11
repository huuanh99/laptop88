package laptop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import laptop.model.product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
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
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		String delete = request.getParameter("delete");
		order order = (order) session.getAttribute("order");
		List<item> listItem = order.getListItem();
		int i;
		if (delete.equals("true")) {
			for (i = 0; i < listItem.size(); i++) {
				if (i == id) {
					listItem.remove(i);
				}
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("shop-cart.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int id = Integer.parseInt(request.getParameter("id"));
		int i;

		HttpSession session = request.getSession();

		product product = laptopDAO.selectProductById(id);
		if (session.getAttribute("order") == null) {
			order order = new order();
			List<item> listItem = new ArrayList<item>();
			item item = new item();
			item.setQuantity(quantity);
			item.setProduct(product);
			listItem.add(item);
			order.setListItem(listItem);
			session.setAttribute("order", order);
			request.setAttribute("listItem", listItem);

		} else {
			order order = (order) session.getAttribute("order");
			List<item> listItem = order.getListItem();
			boolean check = false;
			for (item item : listItem) {
				if (item.getProduct().getId() == product.getId()) {
					item.setQuantity(item.getQuantity() + quantity);
					check = true;
				}
			}
			if (check == false) {
				item item = new item();
				item.setProduct(product);
				item.setQuantity(quantity);
				listItem.add(item);
			}
			order.setListItem(listItem);
			session.setAttribute("order", order);
			request.setAttribute("listItem", listItem);

		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("shop-cart.jsp");
		dispatcher.forward(request, response);
	}

}
