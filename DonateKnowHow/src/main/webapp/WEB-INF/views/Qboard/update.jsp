<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>


<meta charset='utf-8'>
	<center>
	<hr width='600' size='2' noshade>
	<h2>UPDATE</h2>
	<hr width='600' size='2' noshade>
	<form name='update' method='post' action='Qupdate'>
		<input type='hidden' name='q_no' value='${list.q_no}'>
		<input type='hidden' name='q_rdate' value='${list.q_rdate}'>
		<table border='1' width='600' align='center' cellpadding='3'
			cellspacing='1'>

			<tr>
				<td width='30%' align='center'>NICKNAME</td>
				<td align='center'><input type='text' name='nickname' size='60'
					value='${list.nickname}' disabled></td>
			</tr>
			<tr>
				<td width='30%' align='center'>EMAIL</td>
				<td align='center'><input type='text' name='email' size='60'
					value='${list.email}' disabled></td>
			</tr>
			<tr>
				<td width='30%' align='center'>TITLE</td>
				<td align='center'><input type='text' name='q_title' size='60'
					value='${list.q_title}'></td>
			</tr>
			<tr>
				<td width='30%' align='center'>CONTENT</td>
				<td align='center'><textarea name='q_content' rows='5' cols='53'>${list.q_content}</textarea></td>
				<td align='center'><textarea wrap='hard' name='q_content' rows='5' cols='53'>${list.q_content}</textarea></td>
			</tr>
			<tr>
		     <td colspan="2" align="center">
			    <input type="submit" value="SAVE">
				<input type="reset" value="RESET">
			 </td>
		  </tr>
	
		</table>
	</form>
	</table>
	<hr width='600' size='2' noshade>
	<b>
		| <a href='list'>LIST</a> |
	</b>
	<hr width='600' size='2' noshade>
	
	</center>
	
	</body>
</html>