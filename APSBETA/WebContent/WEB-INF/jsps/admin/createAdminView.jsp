<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/aps.css">
<title>Create Product</title>
</head>
<body>

	<jsp:include page="../../jsps/includes/_header.jsp"></jsp:include>
	<br>
	<h3>&nbsp;Inserir Usuário de Sistema</h3>
	<br>
	<p style="color: red;">${errorString}</p>

	<form method="POST"
		action="${pageContext.request.contextPath}/admincreate">
		<table id="myTable">
			<tr>
				<td>Matricula</td>
				<td><input type="text" name="matricula"
					value="${user.matricula}" /></td>
			</tr>
			<tr>
				<td>Login</td>
				<td><input type="text" name="login" value="${user.login}" /></td>
			</tr>
			<tr>
				<td>Senha</td>
				<td><input type="text" name="senha" value="${user.senha}" /></td>
			</tr>
			<tr>
				<td>Tipo de Acesso</td>
				<td><select name="tipoacesso" class="styled-select slate">
						<option>Selecione um tipo de acesso</option>
						<option value="1">Admin</option>
						<option value="2">Usuario</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input id="myInputEdit" type="submit"
					value="Salvar" /> <input type="button" id="myInputEdit"
					class="button_active"
					onclick="location.href='${pageContext.request.contextPath}/admin';"
					value="Cancelar" />
			</tr>
		</table>
	</form>
	<jsp:include page="../../jsps/includes/_footer.jsp"></jsp:include>

</body>
</html>