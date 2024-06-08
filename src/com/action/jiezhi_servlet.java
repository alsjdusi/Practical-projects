package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TJiezhi;

public class jiezhi_servlet extends HttpServlet{
    public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException {
        String type = req.getParameter("type");

        if (type.endsWith("jiezhiAdd")) {
            jiezhiAdd(req, res);
        }
        if (type.endsWith("jiezhiList")) {
            jiezhiList(req, res);
        }
        if(type.endsWith("jiezhiDel"))
        {
            jiezhiDel(req, res);
        }
    }
    public void jiezhiAdd(HttpServletRequest req,HttpServletResponse res)
    {
        String name=req.getParameter("name");
        String bumen=req.getParameter("bumen");
        String date=req.getParameter("date");
        String jzmingcheng=req.getParameter("jzmingcheng");
        String money=req.getParameter("money");
        String cause=req.getParameter("cause");
        String remoney=req.getParameter("remoney");
        String redate=req.getParameter("redate");
        String remethod=req.getParameter("remethod");
        String del="no";

        String sql="insert into t_jiezhi (name,bumen,date,jzmingcheng,money,cause,remoney,redate,remethod,del) " +
                "values(?,?,?,?,?,?,?,?,?,?)";
        Object[] params={name,bumen,date,jzmingcheng,money,cause,remoney,redate,remethod,del};
        DB mydb=new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "操作成功");
      // req.setAttribute("path", "jiezhi?type=jiezhAdd");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void jiezhiList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
    {
        String sql="select * from t_jiezhi where del='no'";

        req.setAttribute("jiezhiList", getjiezhiList(sql));
        req.getRequestDispatcher("admin/jiezhi/jiezhiList.jsp").forward(req, res);
    }

    private List getjiezhiList(String sql)
    {
        //System.out.println("@@@@@@");
        List jiezhiList=new ArrayList();
        Object[] params={};
        DB mydb=new DB();
        try
        {
            mydb.doPstm(sql, params);
            ResultSet rs=mydb.getRs();
            while(rs.next())
            {
                TJiezhi jiezhi=new TJiezhi();
                jiezhi.setId(rs.getInt("id"));
                jiezhi.setName(rs.getString("name"));
                jiezhi.setBumen(rs.getString("bumen"));
                jiezhi.setDate(rs.getString("date"));
                jiezhi.setJzmingcheng(rs.getString("jzmingcheng"));
                jiezhi.setMoney(rs.getString("money"));
                jiezhi.setCause(rs.getString("cause"));
                jiezhi.setRemoney(rs.getString("remoney"));
                jiezhi.setRedate(rs.getString("redate"));
                int remethod =rs.getInt("remethod");
                jiezhi.setRemethod(getLxmc(remethod));
                jiezhiList.add(jiezhi);
            }
            rs.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        mydb.closed();
        return jiezhiList;
    }
    public void jiezhiDel(HttpServletRequest req,HttpServletResponse res)
    {
        String sql="update t_jiezhi set del='yes' where id="+Integer.parseInt(req.getParameter("id"));

        Object[] params={};
        DB mydb=new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "操作成功");
        req.setAttribute("path", "jiezhi?type=jiezhiList");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    private String getLxmc(int remethod)
    {
        String result = "";
        switch(remethod)
        {
            case 0:
                result = "现金";
                break;
            case 1:
                result = "转账";
                break;
        }
        return result;
    }

    public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response)
    {
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
        try
        {
            dispatch.forward(request, response);
            return;
        }
        catch (ServletException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {

            e.printStackTrace();
        }
    }
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
    }

    public void destroy()
    {

    }
}
