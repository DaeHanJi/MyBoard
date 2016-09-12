<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div style="width: 100%;margin:auto;" >
	<c:if test="${modFlag=='n'}">
	<form action='commitMod' method="post" />
	<table border="1" align='center'>
		<tr>
			<td>
				<textarea rows="3" cols="80" name='comContent' >${comContent} 수정해!!</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right">
					<input type="hidden" name="modFlag" value="y"/>
					<input type='hidden' name='comNo' value='${comNo}' />
					<input type='hidden' name='no' value='${board.no}' />
					<input type='submit'  value='수정' style="width: 80px; "/>
				</div>
			</td>
		</tr>
	</table>
	</form>
	</c:if>
	<c:if test="${empty comNo or modFlag == 'y'}">
	<form action='commit' method='post'>
	<table border="1" align='center'>
		<tr>
			<td>
				<textarea rows="3" cols="80" name='comContent' >댓글을 쓰시오~</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right">
					<input type='hidden' name='no' value='${board.no}' />
					<input type='submit'  value='등록' style="width: 80px; "/>
				</div>
			</td>
		</tr>
	</table>
	</form>
	</c:if>
	</div>
