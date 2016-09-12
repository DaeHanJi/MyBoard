<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<hr>
	<div style="width: 60%; margin: auto;">
	전체 <c:out value="${fn:length(cList)}"/> 개
	 
	 <table width='100%' border='1' align = 'center'>
	<c:forEach var="commit" items="${cList}">
		<tr>
			<td width="10%"><c:out value="${commit.comWriter}"/></td>
			<td colspan='2'><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${commit.comRegDate}"/></td>
		</tr>
		<tr>
			<td colspan='2'>${commit.comContent}</td>
			<td width="82px" align="right" >
			<c:if test="${sessionScope.user.userId==commit.comWriter}">
			<form action="commitMod" method="post">
			<input type="hidden" name="modFlag" value="n"/>
			<input type="hidden" name="no" value="${board.no}"/>
			<input type="hidden" name="comNo" value="${commit.comNo}"/>
			<input type="hidden" name="comContent" value="${commit.comContent}"/>
			<input type="submit" value="수정" />
			</form>
			<form action="commitDel" method="post">
			<input type="hidden" name="no" value="${board.no}"/>
			<input type="hidden" name="comNo" value="${commit.comNo}"/>
			<input type="submit" value="삭제" /></td>
			</form>
			</c:if>
		</tr>
	</c:forEach>
	</table>
	</div>
	<hr>	
	
	
	
	
	
	
	
	
	