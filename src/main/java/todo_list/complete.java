package todo_list;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
 * Servlet implementation class Complete
 */
public class complete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public complete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		int check = Integer.parseInt(request.getParameter("check"));
		
		Configuration conf = new Configuration().configure().addAnnotatedClass(Events.class);
	    SessionFactory sf = conf.buildSessionFactory();
	    Session sess = sf.openSession();
	    Transaction tx = sess.beginTransaction();
	    Events event=sess.get(Events.class, id);
	    boolean set_check;
	    System.out.println(check);
	    if(check==1){
	    	set_check=true;
	    }
	    else {
	    	set_check=false;
	    }
	    event.setIs_completed(set_check);
	    sess.saveOrUpdate(event);
	    tx.commit();
	    out.print("Completed");
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");  
		String severity = request.getParameter("severity");
		severity = severity.split("_")[1];
		Configuration conf = new Configuration().configure().addAnnotatedClass(Events.class);
	    SessionFactory sf = conf.buildSessionFactory();
	    Session sess = sf.openSession();
	    Transaction tx = sess.beginTransaction();
	    Query q = sess.createQuery("select id,description from Events where is_completed=True and severity=\""+severity+"\"");
	    List<Object[]> events = (List<Object[]>) q.list();
	    JSONArray completed = new JSONArray();
	    for(Object[] o: events) {
	    	completed.put("{\""+o[0]+"\":\""+o[1]+"\"}");
	    }
	    tx.commit();
	    JSONObject jsonObject=new JSONObject();
	    jsonObject.put("completed", completed);
	    PrintWriter out = response.getWriter();
	    out.print(jsonObject);
		out.flush();
		System.out.println(jsonObject);
	}

}
