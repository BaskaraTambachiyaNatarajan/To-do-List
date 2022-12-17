package todo_list;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class temp
 */
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json"); 
	    String desc = request.getParameter("description");
	    String severity = request.getParameter("severity");
	    
	          
	    Events e = new Events();
	    e.setDescription(desc);
	    e.setSeverity(severity);
	    e.setIs_completed(false);
	    
	    
	    Configuration conf = new Configuration().configure().addAnnotatedClass(Events.class);
	    SessionFactory sf = conf.buildSessionFactory();
	    Session sess = sf.openSession();
	    Transaction tx = sess.beginTransaction();
	    sess.save(e);
	    tx.commit();
	}

}
