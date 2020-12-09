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
import laptop.model.admin;

/**
 * Servlet implementation class adminAPI
 */
@WebServlet("/api/admins")
public class adminAPI extends HttpServlet {
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

	public adminAPI() {
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
			List<admin> admins = laptopDAO.selectAllAdmin();
			pw.println(gson.toJson(admins));
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			admin admin = laptopDAO.selectAdminById(id);
			pw.println(gson.toJson(admin));
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
		request.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		BufferedReader reader = request.getReader();
		StringBuffer sb = new StringBuffer();
		String str;
		while ((str = reader.readLine()) != null) {
			sb.append(str);
		}
		admin newAdmin = gson.fromJson(sb.toString(), admin.class);
		newAdmin.setPassword(MD5(newAdmin.getPassword()));
		try {
			laptopDAO.insertAdmin(newAdmin);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.println(gson.toJson(newAdmin));
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		BufferedReader reader = request.getReader();
		StringBuffer sb = new StringBuffer();
		String str;
		while ((str = reader.readLine()) != null) {
			sb.append(str);
		}
		admin newAdmin = gson.fromJson(sb.toString(), admin.class);
		newAdmin.setPassword(MD5(newAdmin.getPassword()));
		try {
			laptopDAO.updateAdmin(newAdmin, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.println(gson.toJson(newAdmin));
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/plain");
		PrintWriter pw = response.getWriter();
		try {
			laptopDAO.deleteAdmin(id);
			pw.println("DELETE SUCCESSFUL");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
