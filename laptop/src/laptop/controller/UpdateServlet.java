package laptop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import laptop.model.item;
import laptop.model.order;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public UpdateServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int number = Integer.parseInt(request.getParameter("number"));
		HttpSession session = request.getSession();
		int i;
		int id = Integer.parseInt(request.getParameter("id"));
		order order = (order) session.getAttribute("order");
		List<item> listItem = order.getListItem();
		for (i = 0; i < listItem.size(); i++) {
			if (i == id) {
				listItem.get(i).setQuantity(number);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("shop-cart.jsp");
		dispatcher.forward(request, response);
	}

}
