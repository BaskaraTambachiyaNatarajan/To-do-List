package todo_list;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class main
 */
public class main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");  
		JSONArray veryHigh = new JSONArray();
		JSONArray high = new JSONArray();
		JSONArray medium = new JSONArray();
		JSONArray low = new JSONArray();
		Configuration conf = new Configuration().configure().addAnnotatedClass(Events.class);
	    SessionFactory sf = conf.buildSessionFactory();
	    Session sess = sf.openSession();
	    Transaction tx = sess.beginTransaction();
	    Query q = sess.createQuery("select id,description,severity from Events where is_completed=False");
	    List<Object[]> events = (List<Object[]>) q.list();
	    for(Object[] o: events) {
	    	if(o[2].equals("Very High")) {
	    		veryHigh.put("{\""+o[0]+"\":\""+o[1]+"\"}");
	    	}
	    	if(o[2].equals("High")) {
	    		high.put("{\""+o[0]+"\":\""+o[1]+"\"}");
	    	}
	    	if(o[2].equals("Medium")) {
	    		medium.put("{\""+o[0]+"\":\""+o[1]+"\"}");
	    	}
	    	if(o[2].equals("Low")) {
	    		low.put("{\""+o[0]+"\":\""+o[1]+"\"}");
	    	}
	    }
	    System.out.println(veryHigh.length());
	    tx.commit();
	 PrintWriter out = response.getWriter();
	 JSONObject jsonObject=new JSONObject();
	 jsonObject.put("veryHigh", veryHigh);
	 jsonObject.put("high", high);
	 jsonObject.put("medium", medium);
	 jsonObject.put("low", low);
	 System.out.println(jsonObject);
	 out.print(jsonObject);
	 out.flush();
	}

}
