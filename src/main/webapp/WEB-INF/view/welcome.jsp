<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<style>
.ippopup_content {
	position:fixed;
	left: 50%;
	top: 50%;
    height: auto;
    border: 3px solid #0084cc;
    border-radius: 5px;
    padding: 5px;
    color: #0084cc;
    opacity: inherit;
}
 
#example td {
  border-top: 1px solid #edf0f5;
  border-bottom: 1px solid #edf0f5;
  border-right: 1px solid #edf0f5;
}
#example {
  font-family: GillSans;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
 /*  line-height: 1.57; */
  /* letter-spacing: 1.0px; */
  text-align: left;
 
}
.dataTables_wrapper .dataTables_info{
font-family: GillSans;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  /* line-height: 1.57; */
  /* letter-spacing: 1.0px; */
  text-align: left;
}

table.display thead th {
    padding: 0px 30px 4px 5px;
    border-bottom: 1px solid black;
    }
</style>
<body>
        <!-- your code -->
          <div class="col-lg-12 grid-margin stretch-card" >
              <div class="card ">
                <div class="card-body">
                  <div class="table-responsive">
                  <br>  
                   <h2>Welcome ${username }</h2>
                   <table class="table" id="example">
						<thead style="background-color:#0084cc">
							<tr>
								<th>Department</th>
								<th>Pass %</th>
								<th>Student Name</th>
								<th>Marks</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="score" items="${details}">
								<tr>
									<td rowspan="${score.total +1}">${score.department}</td>
									<td rowspan="${score.total +1}">${score.pass}</td>
									<c:forEach var="student" items="${score.student}">
									<tr>
									<td onclick="call('${student.studentName}')">${student.studentId}</td>
									<td>${student.marks}</td>
									</tr>
									</c:forEach>
									</tr>
							</c:forEach>
						</tbody>
					</table>
                  </div>
                </div>
              </div>
            </div>
<div class="ippopup_content" id="pop" style="display:none">
<h2 id="popname"></h2>
</div>
</body>
<script>
function call(name) {
	document.getElementById('pop').style.display="block"
	document.getElementById('popname').innerHTML = "Student Name is " + name;	
}
</script>
</html>
