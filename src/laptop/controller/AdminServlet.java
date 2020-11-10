package laptop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import laptop.management.dao.LaptopDAO;
import laptop.model.brand;
import laptop.model.product;
import laptop.model.type;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
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
	public AdminServlet() {
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
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		String add = request.getParameter("add");
		String logout = request.getParameter("logout");
		request.setAttribute("add", add);
		if (update != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			product product = laptopDAO.selectProductById(id);
			List<brand> brands = laptopDAO.selectAllBrand();
			List<type> types = laptopDAO.selectAllType();

			request.setAttribute("product", product);
			request.setAttribute("brands", brands);
			request.setAttribute("types", types);

			RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
			dispatcher.forward(request, response);
		} else if (add != null) {
			List<brand> brands = laptopDAO.selectAllBrand();
			List<type> types = laptopDAO.selectAllType();
			request.setAttribute("brands", brands);
			request.setAttribute("types", types);

			RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
			dispatcher.forward(request, response);
		} else if (logout != null) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", null);
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
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				laptopDAO.deleteProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List<product> listProduct = laptopDAO.selectAllProduct();
			request.setAttribute("message", "Xóa sản phẩm thành công");
			request.setAttribute("listProduct", listProduct);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("id") != null) {
			product product = new product();
			product.setImage(request.getParameter("image"));
			product.setId(Integer.parseInt(request.getParameter("id")));
			product.setDescription(request.getParameter("description"));
			product.setMoney(Integer.parseInt(request.getParameter("price")));
			product.setName(request.getParameter("name"));
			product.setBrand(request.getParameter("brand"));
			product.setType(request.getParameter("type"));
			product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			try {
				laptopDAO.updateProduct(product);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("message", "Cập nhập sản phẩm thành công");
		} else {
			product product = new product();
			product.setImage(request.getParameter("image"));
			product.setDescription(request.getParameter("description"));
			product.setMoney(Integer.parseInt(request.getParameter("price")));
			product.setName(request.getParameter("name"));
			product.setBrand(request.getParameter("brand"));
			product.setType(request.getParameter("type"));
			product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			try {
				laptopDAO.insertProduct(product);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("message", "Thêm sản phẩm thành công");
		}

		List<product> listProduct = laptopDAO.selectAllProduct();
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
		dispatcher.forward(request, response);
	}

}
