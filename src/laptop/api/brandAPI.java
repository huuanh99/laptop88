package laptop.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import laptop.management.dao.LaptopDAO;
import laptop.model.brand;

/**
 * Servlet implementation class brandAPI
 */
@WebServlet("/api/brands")
public class brandAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LaptopDAO laptopDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		laptopDAO = new LaptopDAO();

	}

	public brandAPI() {
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
			List<brand> brands = laptopDAO.selectAllBrand();
			pw.println(gson.toJson(brands));
		} else if (request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			brand brands = laptopDAO.selectBrandById(id);
			pw.println(gson.toJson(brands));
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		BufferedReader reader = request.getReader();
		StringBuffer sb = new StringBuffer();
		String str;
		while ((str = reader.readLine()) != null) {
			sb.append(str);
		}
		brand newBrand = gson.fromJson(sb.toString(), brand.class);
		try {
			laptopDAO.insertBrand(newBrand);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.println(gson.toJson(newBrand));
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		BufferedReader reader = request.getReader();
		StringBuffer sb = new StringBuffer();
		String str;
		while ((str = reader.readLine()) != null) {
			sb.append(str);
		}
		brand newBrand = gson.fromJson(sb.toString(), brand.class);
		try {
			laptopDAO.updateBrand(newBrand, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.println(gson.toJson(newBrand));
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/plain");
		PrintWriter pw = response.getWriter();
		try {
			laptopDAO.deleteBrand(id);
			pw.println("DELETE SUCCESSFUL");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
