<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
    <meta http-equiv="description" content="This is my page" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
    <script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
</head>

<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
<form action="<%=path %>/jiezhi?type=jiezhiAdd" name="formAdd" method="post">
    <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
        <tr bgcolor="#E7E7E7">
            <td height="14" colspan="30" background="<%=path %>/img/tbg.gif">借支信息添加</td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                员工名字：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="name" size="20"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                员工部门：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="bumen" size="20"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                申请日期：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input name="date" readonly="readonly" class="Wdate"
                       type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                借支项目名称：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="jzmingcheng" size="20"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                借支金额：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="money" size="20"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                借支原因：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="cause" size="20"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                返还金额：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="remoney" size="20"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                返还日期：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input name="redate" readonly="readonly" class="Wdate"
                       type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                返还方式：
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <select name="remethod">
                    <option value="0">现金</option>
                    <option value="1">转账</option>
                </select>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                &nbsp;
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="submit" value="提交"/>&nbsp;
                <input type="reset" value="重置"/>&nbsp;
            </td>
        </tr>
    </table>
</form>
</body>
</html>
