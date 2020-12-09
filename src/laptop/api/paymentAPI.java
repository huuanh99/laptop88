package laptop.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import laptop.management.dao.LaptopDAO;
import laptop.model.payment;

/**
 * Servlet implementation class paymentAPI
 */
@WebServlet("/api/payments")
public class paymentAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LaptopDAO laptopDAO;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		laptopDAO = new LaptopDAO();

	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public paymentAPI() {
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
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		Gson gson = new Gson();
		PrintWriter pw = response.getWriter();
		if (request.getParameter("id") == null) {
			List<payment> payments = laptopDAO.selectAllPayment();
			pw.println(gson.toJson(payments));
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			payment payment = laptopDAO.selectPaymentById(id);
			pw.println(gson.toJson(payment));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
