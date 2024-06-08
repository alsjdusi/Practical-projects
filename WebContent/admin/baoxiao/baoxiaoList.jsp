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
        function baoxiaoDel(id)
        {
            if(confirm('您确定同意吗？'))
            {
                window.location.href="<%=path %>/baoxiao?type=baoxiaoDel&id="+id;
            }
        }
    </script>
</head>

<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="30" background="<%=path %>/img/tbg.gif">报销信息查看</td>
    </tr>
    <tr align="center" bgcolor="#FAFAF1" height="22">
        <td>员工名字</td>
        <td>员工部门</td>
        <td>提交日期</td>
        <td>报销名称</td>
        <td>报销金额</td>
        <td>报销事由</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${requestScope.baoxiaoList}" var="baoxiao">
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td bgcolor="#FFFFFF" align="center">
                    ${baoxiao.name}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${baoxiao.bumen}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${baoxiao.date}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${baoxiao.bxmingcheng}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${baoxiao.money}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${baoxiao.cause}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <form action="<%=path %>/admin/baoxiao/baoxiaoEditPre.jsp" method="post">
                    <input type="hidden" name="id" value="${baoxiao.id }"/>
                    <input type="hidden" name="name" value="${baoxiao.name }"/>
                    <input type="hidden" name="bumen" value="${baoxiao.bumen }"/>
                    <input type="hidden" name="date" value="${baoxiao.date }"/>
                    <input type="hidden" name="bxmingcheng" value="${baoxiao.bxmingcheng }"/>
                    <input type="hidden" name="money" value="${baoxiao.money }"/>
                    <input type="hidden" name="cause" value="${baoxiao.cause }"/>
                    <input type="button" value="同意" onclick="baoxiaoDel(${baoxiao.id})"/>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
