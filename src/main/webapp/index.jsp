<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONArray" %>
<!doctype html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>
        To do List
    </title>
    <head>
    <script src="js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="js/popper.min.js" crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    var high;
    var very_high;
    var medium;
    var low;
    window.addEventListener("load", (event) => {
    	load_data();
    });

    function load_data() {
    	document.getElementById("loader").style.display = "block";
    $.ajax({url: "main", success: function(result){
    	very_high=result["veryHigh"];
    	high=result["high"];
    	medium=result["medium"];
    	low=result["low"];
    	document.getElementById("very_high").innerHTML = "";
    	document.getElementById("high").innerHTML = "";
    	document.getElementById("medium").innerHTML = "";
    	document.getElementById("low").innerHTML = "";
    	for (let i = 0; i < very_high.length; i++) {
    	const node = document.createElement("li");
    	node.setAttribute("class","list-group-item");
    	node.setAttribute("style","background-color: #ff8080;");
    	const JSON_Obj = JSON.parse(very_high[i]);
    	var event_id;
    	var desc;
    	for (var key in JSON_Obj) {
    	       event_id=key
    	       desc=JSON_Obj[key];
    	   }
    	node.innerHTML="<input class=\"form-check-input me-1\" type=\"checkbox\" id="+key+" onclick=\"check(this)\">"+desc
    	document.getElementById("very_high").appendChild(node);
    	}
    	
    	for (let i = 0; i < high.length; i++) {
    	const node = document.createElement("li");
    	node.setAttribute("class","list-group-item");
    	node.setAttribute("style","background-color: #ffe699;");
    	const JSON_Obj = JSON.parse(high[i]);
    	var event_id;
    	var desc;
    	for (var key in JSON_Obj) {
    	       event_id=key
    	       desc=JSON_Obj[key];
    	   }
    	node.innerHTML="<input class=\"form-check-input me-1\" type=\"checkbox\" id="+key+" onclick=\"check(this)\">"+desc
    	document.getElementById("high").appendChild(node);
    	}
    	
    	for (let i = 0; i < medium.length; i++) {
    	const node = document.createElement("li");
    	node.setAttribute("class","list-group-item");
    	node.setAttribute("style","background-color: #92a8d1");
    	const JSON_Obj = JSON.parse(medium[i]);
    	var event_id;
    	var desc;
    	for (var key in JSON_Obj) {
    	       event_id=key
    	       desc=JSON_Obj[key];
    	   }
    	node.innerHTML="<input class=\"form-check-input me-1\" type=\"checkbox\" id="+key+" onclick=\"check(this)\">"+desc
    	document.getElementById("medium").appendChild(node);
    	}
    	
    	for (let i = 0; i < low.length; i++) {
    	const node = document.createElement("li");
    	node.setAttribute("class","list-group-item");
    	node.setAttribute("style","background-color: #bfbfbf;");
    	const JSON_Obj = JSON.parse(low[i]);
    	var event_id;
    	var desc;
    	for (var key in JSON_Obj) {
    	       event_id=key
    	       desc=JSON_Obj[key];
    	   }
    	node.innerHTML="<input class=\"form-check-input me-1\" type=\"checkbox\" id="+key+" onclick=\"check(this)\">"+desc
    	document.getElementById("low").appendChild(node);
    	document.getElementById("loader").style.display = "none";
    	}
   	  }});
		
    }
    </script>
    </head>
    <style>
    select option:nth-child(3) {
  color: blue;
}
    select option:nth-child(2) {
  color: orange;
}
select option:nth-child(1) {
  color: red;
}
body,html{padding:0; margin:0;height:100%;width:100%;}


#menu {
    position: fixed;
    width: 100%;
}

.part1 {
    width:40%;
    height: 40%;
    float: left;
    background: #ff8080;
    position: absolute;
  	left: 5%;
  	top:5%;
  	overflow: scroll;
}
.part2 {
    width:40%;
    height: 40%;
    float: left;
    background: #ffe699;
    position: absolute;
  	right: 5%;
  	top:5%;
  	overflow: scroll;
}
.part3 {
    width:40%;
    height: 40%;
    float: left;
    background: #92a8d1;
    position: absolute;
  	left: 5%;
  	bottom:5%;
  	overflow: scroll;
}
.part4 {
    width:40%;
    height: 40%;
    float: left;
    background: #bfbfbf;
    position: absolute;
  	right: 5%;
  	bottom:5%;
  	overflow: scroll;
}

.content{
    width: 100%;
    position: relative;
}

h2{
text-indent: 5px;
}

/* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

</style>
    
    <body id="body">
    <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;" id="menu">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" >To Do List</a>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal">
  				Add new event
	</button>
  </div>
</nav>  
  <div id="loader"></div>
<div class="content">
    <div class="part1">
    <div class="container">
  <div class="row">
    <div class="col-sm-9">
      <h2>Very High Priority</h2>
    </div>
    <div class="col-sm-3">
      <button type="button" class="btn btn-link" style="margin-top: 1%;" id="completed_Very High" onclick=completed(this)>completed</button>
    </div>
  </div>
</div>
        <ul class="list-group list-group-flush" id="very_high">
        </ul>
    </div>
    <div class="part2"><div class="container">
  <div class="row">
    <div class="col-sm-9">
      <h2>High Priority</h2>
    </div>
    <div class="col-sm-3">
      <button type="button" class="btn btn-link" style="margin-top: 1%;" id="completed_High" onclick=completed(this)>completed</button>
    </div>
  </div>
</div>  
         <ul class="list-group list-group-flush" id="high">
        </ul>
    </div>
    <div class="part3"><div class="container">
  <div class="row">
    <div class="col-sm-9">
      <h2>Medium Priority</h2>
    </div>
    <div class="col-sm-3">
      <button type="button" class="btn btn-link" style="margin-top: 1%;" id="completed_Medium" onclick=completed(this)>completed</button>
    </div>
  </div>
</div>
         <ul class="list-group list-group-flush" id="medium">
        </ul>
    </div>
    <div class="part4"><div class="container">
  <div class="row">
    <div class="col-sm-9">
      <h2>Low Priority</h2>
    </div>
    <div class="col-sm-3">
      <button type="button" class="btn btn-link" style="margin-top: 1%;" id="completed_Low" onclick=completed(this)>completed</button>
    </div>
  </div>
</div>
         <ul class="list-group list-group-flush" id="low">
        </ul>
    </div>
</div>

<!-- Modal For Add -->
<div class="modal fade" id="modal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="modalLabel">Add Event</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <form action="add" id="example-form">
      <div class="modal-body">
      	<div class="container-fluid">
            	<div class="row">
            		<div class="col-md-4"><label class="form-label">Description</label></div>
      				<div class="col-md">
      				<input type="text" class="form-control" name="description" required>
      				</div>
            	</div>
            	<br/>
            	<div class="row">
            		<div class="col-md-4"><label class="form-label">Severity</label></div>
            		<div class="col-md">
            		<select class="form-select" name="severity" required>
      					<option value="Very High">Very High</option>
      					<option value="High">High</option>
			            <option value="Medium">Medium</option>
			            <option value="Low">Low</option>
    					</select>
            		</div>
			        </div>
			    </div>
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" value="add" data-bs-dismiss="modal">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
        
        
<!-- Modal For Viewing completed tasks -->
  <div class="modal fade" id="completedModal" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    
      <!-- Modal content-->
      <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Completed</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body" id="show_complete">
        </div>
      </div>
      
    </div>
  </div>
  
        
        
       	
       	
       	<script>
       	
       	var height = $(document).height();
       	var menu_height = $("#menu").height();
       	var content_height = height - menu_height;

       	$(".content").css("height", content_height);
       	$(".content").css("top", menu_height);
       	
       	document.getElementById("loader").style.display = "block";
       	const exampleForm = document.getElementById("example-form");
       	exampleForm.addEventListener("submit", handleFormSubmit);
       	
       	async function handleFormSubmit(event) {
       		event.preventDefault();
       		const form = event.currentTarget;
       		const url = form.action;
       		
       		try {
       			const formData = new FormData(form);
       			const responseData = await postFormDataAsJson({ url, formData });

       			console.log({ responseData });
       		} catch (error) {
       			console.error(error);
       		}
       	}
       	
       	document.getElementById("loader").style.display = "block";
       	async function postFormDataAsJson({ url, formData }) {
       		const plainFormData = Object.fromEntries(formData.entries());
       		const desc=Object.values(plainFormData)[0];
       		const severity=Object.values(plainFormData)[1];

       		const fetchOptions = {
       			method: "POST",
       			headers: {
       				"Content-Type": "application/json",
       				Accept: "application/json",
       			}
       		};
			const full_url = url.concat("?description=",desc,"&severity=",severity);
       		const response = await fetch(full_url, fetchOptions);

       		if (!response.ok) {
       			const errorMessage = await response.text();
       			throw new Error(errorMessage);
       		}
       		else{
           	load_data();
       		}
       	}
       	
       	function check(element) {
       		var id = element.getAttribute("id");
       		var full_url = "complete?id=".concat(id,"&check=1")
       		document.getElementById("loader").style.display = "block";
       		$.post({url: full_url, success: function(result){
           			if(result==="Completed"){
           	    	load_data();
           			}
           		}});
       		
       	}
       	
       	function uncheck(element) {
       		document.getElementById("loader").style.display = "block";
       		var id = element.getAttribute("id");
       		var full_url = "complete?id=".concat(id,"&check=0")
       		$.post({url: full_url, success: function(result){
           			
           		}});
       	}
       	
       	function completed(element){
       		var id = element.getAttribute("id");
       		var full_url = "complete?severity=".concat(id)
       		document.getElementById("loader").style.display = "block";
       		$.ajax({url: full_url, success: function(result){
       			var completed=result["completed"];
       			document.getElementById("show_complete").innerHTML = "";
       			for (let i = 0; i < completed.length; i++) {
       				const node = document.createElement("li");
       		    	node.setAttribute("class","list-group-item");
       		    	console.log(completed[i]);
       		    	const JSON_Obj = JSON.parse(completed[i]);
       		    	var event_id;
       		    	var desc;
       		    	for (var key in JSON_Obj) {
       		    	       event_id=key
       		    	       desc=JSON_Obj[key];
       		    	   }
       		    	node.innerHTML="<input class=\"form-check-input me-1\" type=\"checkbox\" id="+key+" onclick=\"uncheck(this)\">"+desc
       		    	document.getElementById("show_complete").appendChild(node);
       			}
           		}});
       		$("#completedModal").modal("show");
       		$("#newModal").on('shown.bs.modal', function () {
       		  });
       	}
       	
       	
       	$(document).ready(function(){
       	  $("#completedModal").on('hide.bs.modal', function(){
       	load_data();
       	  });
       	});
       	
    </script>
    </body>