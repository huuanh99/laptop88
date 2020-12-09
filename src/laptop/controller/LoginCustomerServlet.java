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

import laptop.management.dao.LaptopDAO;
import laptop.model.product;
import laptop.model.user;

/**
 * Servlet implementation class LoginCustomerServlet
 */
@WebServlet("/loginCustomer")
public class LoginCustomerServlet extends HttpServlet {
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
	public LoginCustomerServlet() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		user user = laptopDAO.logInCustomer(request.getParameter("username"), MD5(request.getParameter("password")));
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("username", user.getUsername());
			session.setAttribute("fullname", user.getFullname());
			session.setAttribute("address", user.getAddress());
			session.setAttribute("phone", user.getPhone());
			List<product> listProduct1 = laptopDAO.selectProductByType("SCHOOL OFFICE");
			List<product> listProduct2 = laptopDAO.selectProductByType("GRAPHICS DESIGN");
			List<product> listProduct3 = laptopDAO.selectProductByType("GAMING");
			List<product> listProduct4 = laptopDAO.selectProductByType("OLD");
			List<product> listProduct5 = laptopDAO.selectProductByType("DELUXE");

			request.setAttribute("listProduct1", listProduct1);
			request.setAttribute("listProduct2", listProduct2);
			request.setAttribute("listProduct3", listProduct3);
			request.setAttribute("listProduct4", listProduct4);
			request.setAttribute("listProduct5", listProduct5);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginCustomer.jsp");
			dispatcher.forward(request, response);
		}
	}

	public String MD5(String md5) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(md5.getBytes());
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < array.length; ++i) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
			}
			return sb.toString();
		} catch (java.security.NoSuchAlgorithmException e) {
		}
		return null;
	}
}
