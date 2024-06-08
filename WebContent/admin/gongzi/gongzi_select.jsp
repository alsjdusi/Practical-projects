<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
    <title>工资查询</title>
</head>
<body>
<form action="<%=path %>/gongzi?type=gongzi_select" method="post">
    <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC">
        <tr bgcolor="#EEF4EA">
            <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>工资查询</span></td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" height="22">
            <td width="25%" align="right">
                查询类型：
            </td>
            <td width="75%" align="left">
                <select name="queryType">
                    <option value="month">按月</option>
                    <option value="quarter">按季度</option>
                    <option value="year">按年</option>
                </select>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" height="22">
            <td width="25%" align="right">
                日期：
            </td>
            <td width="75%" align="left">
                <input type="text" name="dateValue" size="20" placeholder="格式：YYYY-MM"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" height="22">
            <td colspan="2" align="center">
                <input type="submit" value="查询"/>
            </td>
        </tr>
    </table>
</form>

<c:if test="${not empty gongziList}">
    <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-top:10px">
        <tr bgcolor="#EEF4EA">
            <td colspan="8" background="<%=path %>/img/wbg.gif" class='title'><span>查询结果</span></td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" height="22">
            <td>ID</td>
            <td>职工ID</td>
            <td>职工名</td>
            <td>基本工资</td>
            <td>工龄</td>
            <td>职务</td>
            <td>补贴</td>
            <td>日期</td>
            <td>合计</td>
        </tr>
        <c:forEach var="gongzi" items="${gongziList}">
            <tr align='center' bgcolor="#FFFFFF" height="22">
                <td>${gongzi.id}</td>
                <td>${gongzi.zhigong_id}</td>
                <td>${gongzi.zgxx.xingming}</td>
                <td>${gongzi.jiben}</td>
                <td>${gongzi.gongling}</td>
                <td>${gongzi.zhiwu}</td>
                <td>${gongzi.butie}</td>
                <td>${gongzi.date}</td>
                <td>${gongzi.hj}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>

