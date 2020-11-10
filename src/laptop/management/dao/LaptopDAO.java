package laptop.management.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import laptop.model.admin;
import laptop.model.brand;
import laptop.model.payment;
import laptop.model.product;
import laptop.model.product_payment;
import laptop.model.type;

public class LaptopDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/laptopdb?characterEncoding=UTF-8&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	private static final String LOGIN = "select * from admin where username=? and password=?";

	private static final String INSERT_LAPTOP_SQL = "INSERT INTO product"
			+ "  (name, image,brand,description,quantity,price,type)" + " VALUES " + " (?, ?, ? , ? , ? , ? , ? );";
	private static final String INSERT_PAYMENT_SQL = "INSERT INTO payment" + "  (name, phone,address,total,status)"
			+ " VALUES " + " (? , ? , ? , ? , ? );";
	private static final String INSERT_ORDER_SQL = "INSERT INTO product_payment" + "  (productId,paymentId,quantity)"
			+ " VALUES " + " (? , ? , ? );";

	private static final String SELECT_LAPTOP_BY_NAME = "select * from product where lower(name) LIKE ?";
	private static final String SELECT_LAPTOP_BY_TYPE = "select * from product where type=?";
	private static final String SELECT_LAPTOP_BY_ID = "select * from product where id =?";
	private static final String SELECT_ALL_LAPTOP = "select * from product";
	private static final String SELECT_ALL_BRAND = "select * from brands";
	private static final String SELECT_ALL_TYPE = "select * from type";
	private static final String SELECT_MAX_ID = "select MAX(id) as id from payment";

	private static final String DELETE_LAPTOP_SQL = "delete from product where id = ?;";

	private static final String UPDATE_LAPTOP_SQL = "update product set name = ?,description=?,"
			+ "quantity=?,price=?,brand=?,type=?,image=? where id = ?;";

	public LaptopDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertProduct(product product) throws SQLException {
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_SQL)) {
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getImage());
			preparedStatement.setString(3, product.getBrand());
			preparedStatement.setString(4, product.getDescription());
			preparedStatement.setInt(5, product.getQuantity());
			preparedStatement.setInt(6, product.getMoney());
			preparedStatement.setString(7, product.getType());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public void insertOrder(product_payment product_payment) throws SQLException {
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL)) {
			preparedStatement.setInt(1, product_payment.getProductId());
			preparedStatement.setInt(2, product_payment.getPaymentId());
			preparedStatement.setInt(3, product_payment.getQuantity());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public void insertPayment(payment payment) throws SQLException {
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_SQL)) {
			preparedStatement.setString(1, payment.getName());
			preparedStatement.setString(2, payment.getPhone());
			preparedStatement.setString(3, payment.getAddress());
			preparedStatement.setInt(4, payment.getTotal());
			preparedStatement.setString(5, payment.getStatus());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public admin logIn(String username, String password) {
		admin admin = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(LOGIN);) {
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String userName = rs.getString("username");
				String passWord = rs.getString("password");
				admin = new admin(0, userName, passWord);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return admin;
	}

	public product selectProductById(int id) {
		product product = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LAPTOP_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				String image = rs.getString("image");
				String brand = rs.getString("brand");
				String description = rs.getString("description");
				int quantity = rs.getInt("quantity");
				int money = rs.getInt("price");
				String price = formatMoney(money);
				String type = rs.getString("type");
				product = new product(id, name, money, image, brand, description, quantity, price, type);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return product;
	}

	public int selectMaxId() {
		// Step 1: Establishing a Connection
		int id = 0;
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAX_ID);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				id = rs.getInt("id");
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return id;
	}

	public List<product> selectProductByName(String search) {
		List<product> product = new ArrayList<product>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LAPTOP_BY_NAME);) {
			preparedStatement.setString(1, search);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String image = rs.getString("image");
				String brand = rs.getString("brand");
				String description = rs.getString("description");
				int quantity = rs.getInt("quantity");
				int money = rs.getInt("price");
				String price = formatMoney(money);
				String type = rs.getString("type");
				product.add(new product(id, name, money, image, brand, description, quantity, price, type));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return product;
	}

	public List<product> selectProductByType(String type) {
		List<product> product = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LAPTOP_BY_TYPE);) {
			preparedStatement.setString(1, type);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String image = rs.getString("image");
				String brand = rs.getString("brand");
				String description = rs.getString("description");
				int quantity = rs.getInt("quantity");
				int money = rs.getInt("price");
				String price = formatMoney(money);
				product.add(new product(id, name, money, image, brand, description, quantity, price, type));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return product;
	}

	public List<product> selectAllProduct() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<product> product = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LAPTOP);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String image = rs.getString("image");
				String brand = rs.getString("brand");
				String description = rs.getString("description");
				int quantity = rs.getInt("quantity");
				int money = rs.getInt("price");
				String price = formatMoney(money);
				String type = rs.getString("type");
				product.add(new product(id, name, money, image, brand, description, quantity, price, type));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return product;
	}

	public List<brand> selectAllBrand() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<brand> brand = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BRAND);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("brand");
				brand.add(new brand(id, name));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return brand;
	}

	public List<type> selectAllType() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<type> types = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("type");
				types.add(new type(id, name));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return types;
	}

	public boolean deleteProduct(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_LAPTOP_SQL);) {
			statement.setInt(1, id);
			System.out.println(statement);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateProduct(product product) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_LAPTOP_SQL);) {
			System.out.println(statement);
			statement.setString(1, product.getName());
			statement.setString(2, product.getDescription());
			statement.setInt(3, product.getQuantity());
			statement.setInt(4, product.getMoney());
			statement.setString(5, product.getBrand());
			statement.setString(6, product.getType());
			statement.setString(7, product.getImage());
			statement.setInt(8, product.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		// TODO Auto-generated method stub
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

	public String formatMoney(int money) {
		Locale locale = new Locale("vi", "VN");
		NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
		return currencyFormatter.format(money);
	}
}
