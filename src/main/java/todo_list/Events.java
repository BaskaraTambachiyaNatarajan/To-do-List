package todo_list;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Events {
	
	   @Id
	   @GeneratedValue(strategy=GenerationType.IDENTITY)
	   private int id;
	   private String description; 
	   private String severity;   
	   private int user_id;
	   private boolean is_completed;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSeverity() {
		return severity;
	}
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public boolean isIs_completed() {
		return is_completed;
	}
	public void setIs_completed(boolean is_completed) {
		this.is_completed = is_completed;
	}
	   

	@Override
	public String toString() {
		return "Events [id=" + id + ", description=" + description + ", severity=" + severity + ", user_id=" + user_id
				+ ", is_completed=" + is_completed + "]";
	}
	   
	}
