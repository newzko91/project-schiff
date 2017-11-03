<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

	<div style="background: #2f578c; height: 55px; padding: 5px; color: white">
    <div style="float: left">
      <h1>ManagePort</h1>
    </div>
 
    <div style="float: right; padding: 10px; text-align: right; color: white">
 
     <!-- User store in session with attribute: loginedUser -->
        Hello <b>${loginedUser.userName}</b>
     <br/>
        Search <input name="search">
 
     </div>
 
   </div>