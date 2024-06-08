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
    <script language="javascript">
        function jiezhiDel(id)
        {
            if(confirm('您确定同意吗？'))
            {
                window.location.href="<%=path %>/jiezhi?type=jiezhiDel&id="+id;
            }
        }
    </script>
</head>

<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="30" background="<%=path %>/img/tbg.gif">借支信息查看</td>
    </tr>
    <tr align="center" bgcolor="#FAFAF1" height="22">
        <td>员工名字</td>
        <td>员工部门</td>
        <td>提交日期</td>
        <td>借支名称</td>
        <td>借款金额</td>
        <td>借款事由</td>
        <td>还款金额</td>
        <td>还款日期</td>
        <td>还款方式</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${requestScope.jiezhiList}" var="jiezhi">
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.name}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.bumen}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.date}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.jzmingcheng}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.money}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.cause}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.remoney}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.redate}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${jiezhi.remethod}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <form action="<%=path %>/admin/jiezhi/jiezhiEditPre.jsp" method="post">
                    <input type="hidden" name="id" value="${jiezhi.id }"/>
                    <input type="hidden" name="name" value="${jiezhi.name }"/>
                    <input type="hidden" name="bumen" value="${jiezhi.bumen }"/>
                    <input type="hidden" name="date" value="${jiezhi.date }"/>
                    <input type="hidden" name="jzmingcheng" value="${jiezhi.jzmingcheng }"/>
                    <input type="hidden" name="money" value="${jiezhi.money }"/>
                    <input type="hidden" name="cause" value="${jiezhi.cause }"/>
                    <input type="hidden" name="remoney" value="${jiezhi.remoney }"/>
                    <input type="hidden" name="redate" value="${jiezhi.redate }"/>
                    <input type="hidden" name="remethod" value="${jiezhi.remethod }"/>
                    <input type="button" value="同意" onclick="jiezhiDel(${jiezhi.id})"/>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
