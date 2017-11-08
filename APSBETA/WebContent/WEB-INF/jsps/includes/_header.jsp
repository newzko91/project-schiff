<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}/home'><span>Home</span></a></li>
   <li><a href='#'><span>Embarcações</span></a></li>
   <li><a href='${pageContext.request.contextPath}/pessoas'><span>Pessoas</span></a></li>
   <li class='#'><a href='#'><span>Cargas</span></a></li>
    <li class=''><a href='${pageContext.request.contextPath}/dashboard'><span>Dashboard</span></a></li>
   <li><a href='${pageContext.request.contextPath}/admin'><span>Administração</span></a></li>
   <li><a href='${pageContext.request.contextPath}/logout'><span>Sair</span></a></li>
</ul>
</div>


	<!--  <div style="background: #2f578c; height: 55px; padding: 5px; color: white">
    <div style="float: left">
      <h1>ManagePort</h1>
    </div>
 
    <div style="float: right; padding: 10px; text-align: right; color: white">
 
        Hello <b>${loginedUser.login}</b>
     <br/>
        Search <input name="search">
 
     </div>
 
   </div>
   -->