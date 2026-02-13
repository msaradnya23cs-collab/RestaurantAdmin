import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Simple hardcoded login (change if using DB)
        if ("admin".equals(username) && "admin123".equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("user", username);  // 🔥 THIS IS VERY IMPORTANT

            response.sendRedirect("dashboard.jsp");

        } else {
            response.sendRedirect("login.jsp?error=Invalid Username or Password");
        }
    }
}
