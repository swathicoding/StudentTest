<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<style>

form#login-form {
	width: 35em;
	margin: 2em auto;
	overflow: hidden;
	position: relative;
	border-radius: 0.3em;
	border-style: ridge;
}

form#login-form div.heading {
	/* color: #fff; */
	text-align: center;
	text-transform: uppercase;
	font-weight: bold;
	padding: 0.6em;
}

a:hover {
	color: blue;
	font-weight: bold;
	cursor: pointer;
}


form#login-form div.left {
	width: 50%;
	/* float: left; */
	display: table;
  margin: auto;
	padding: 1.7em 1.5em 2.5em 1.5em;
	box-sizing: border-box;
}

form#login-form div.right {
	width: 50%;
	float: right;
	padding: 1.7em 1.5em 2.5em 1.5em;
	box-sizing: border-box;
}

form#login-form:before {
	content: '';
	color: gray;
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	margin: auto;
	height: 0.5em;
	width: 0.5em;
	left: -1.5em;
	top: 1.2em;
	z-index: 900;
}

</style>
<body>
		<div class="video-container">
			<div class="title-container">
				<div class="headline">
					<form action="authenticate" id="login-form" method="post" onsubmit="return validate();">
						<div id="logindiv">
							<div class="heading">Student Login</div>
							<label for="examplePassword1" id="errormsg"
								style='color: red; margin-right: 0%; margin-left: 0%'>${error}
							</label><br />
							<div class="left">
								<table >
									<tr>
										<td><label for="userid">UserID</label></td>
										<td>&nbsp;&nbsp;</td>
										<td><input type="userid" id="username" name="userid"
											id="emailid" /></td>
									</tr>
									<tr>
										<td><label for="password">Password</label></td>
										<td></td>
										<td><input type="password" name="password" id="password" />
										</td>
									</tr>
									<tr>
									
										<td>&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td></td>
									<td></td>
										<td><input type="submit" value="Login" id="log" /></td>
									</tr>
								</table>
								&nbsp;
							</div>
						</div>
					</form>
				</div>
		</div>
	</div>
	</body>
	<script>
	function validate() {
		var isValid = true;
		var username = document.getElementById('username').value;
		var password = document.getElementById('password').value;
		if(username.trim().length == 0 || username == "undefined") {
			isValid = false;
			document.getElementById('errormsg').innerHTML = "please enter username";
		}
		if(password.trim().length == 0 || password == "undefined") {
			isValid = false
			document.getElementById('errormsg').innerHTML = "please enter username";
		}
		return isValid;
	}
	</script>
</html>