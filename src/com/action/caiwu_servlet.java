package com.action;

import com.dao.DB;
import com.orm.TCaiwu;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class caiwu_servlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException
    {
        String type=req.getParameter("type");

        if(type.endsWith("caiwu_me"))
        {
            caiwu_me(req, res);
        }
        if(type.endsWith("caiwuUpd_me"))
        {
            caiwuUpd_me(req, res);
        }

        if(type.endsWith("caiwuMana"))
        {
            caiwuMana(req, res);
        }
        if(type.endsWith("caiwuList"))
        {
            caiwuList(req, res);
        }
        if(type.endsWith("caiwuAdd"))
        {
            caiwuAdd(req, res);
        }
        if(type.endsWith("caiwuUpd"))
        {
            caiwuUpd(req, res);
        }
        if(type.endsWith("caiwuDel"))
        {
            caiwuDel(req, res);
        }


    }


    public void caiwuAdd(HttpServletRequest req,HttpServletResponse res)
    {
        //String bumen_id=req.getParameter("bumen_id");
        String bumen_id = "3";
        String bianhao=req.getParameter("bianhao");
        String loginpw=req.getParameter("loginpw");
        String xingming=req.getParameter("xingming");
        String xingbie=req.getParameter("xingbie");
        String ruzhi=req.getParameter("ruzhi");
        System.out.println(bianhao);
        System.out.println(loginpw);
        String del="no";
        String sql="insert into t_caiwu (bumen_id,bianhao,loginpw,xingming,xingbie,ruzhi,del) values(?,?,?,?,?,?,?)";
        Object[] params={bumen_id,bianhao,loginpw,xingming,xingbie,ruzhi,del};
        DB mydb=new DB();
        mydb.doPstm(sql, params);
        mydb.closed();
        req.setAttribute("message", "操作成功");
        req.setAttribute("path", "caiwu?type=caiwuMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void caiwuUpd(HttpServletRequest req,HttpServletResponse res)
    {
        String id=req.getParameter("id");
        String bumen_id ="3";
        //String bumen_id=req.getParameter("bumen_id");
        String loginpw=req.getParameter("loginpw");
        String xingming=req.getParameter("xingming");
        String xingbie=req.getParameter("xingbie");
        String ruzhi=req.getParameter("ruzhi");
        String sql="update t_caiwu set bumen_id=?,loginpw=?,xingming=?,xingbie=?,ruzhi=? where id=?";
        Object[] params={bumen_id,loginpw,xingming,xingbie,ruzhi,id};
        DB mydb=new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "操作成功");
        req.setAttribute("path", "caiwu?type=caiwuMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void caiwuUpd_me(HttpServletRequest req,HttpServletResponse res)
    {
        String id=req.getParameter("id");
        String loginpw=req.getParameter("loginpw");
        String xingming=req.getParameter("xingming");
        String xingbie=req.getParameter("xingbie");
        String sql="update t_caiwu set loginpw=?,xingming=?,xingbie=? where id=?";
        Object[] params={loginpw,xingming,xingbie,id};
        DB mydb=new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "操作成功");
        req.setAttribute("path", "caiwu?type=caiwu_me");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void caiwuDel(HttpServletRequest req,HttpServletResponse res)
    {
        String sql="update t_caiwu set del='yes' where id="+Integer.parseInt(req.getParameter("id"));
        Object[] params={};
        DB mydb=new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "操作成功");
        req.setAttribute("path", "caiwu?type=caiwuMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void caiwu_me(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
    {
        TCaiwu caiwu = (TCaiwu)req.getSession().getAttribute("user");
        String sql="select ta.*,tb.mingcheng bmmc,tb.xishu from t_caiwu ta,t_bumen tb " +
                "where ta.del='no' and ta.bumen_id=tb.id and ta.id="+caiwu.getId();

        req.setAttribute("caiwu", (TCaiwu)getCaiwuList(sql).get(0));
        req.getRequestDispatcher("admin/caiwu/caiwu_me.jsp").forward(req, res);
    }

    public void caiwuMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
    {
        String sql="select ta.*,tb.mingcheng bmmc,tb.xishu from t_caiwu ta,t_bumen tb " +
                "where ta.del='no' and ta.bumen_id=tb.id";
        String bianhao = req.getParameter("bianhao")==null?"":req.getParameter("bianhao");
        if(!("".equals(bianhao)))
            sql += " and bianhao like '%"+bianhao+"%'";

        req.setAttribute("bianhao", bianhao);
        req.setAttribute("caiwuList", getCaiwuList(sql));
        req.getRequestDispatcher("admin/caiwu/caiwuMana.jsp").forward(req, res);
    }

    public void caiwuList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
    {
        String sql="select ta.*,tb.mingcheng bmmc,tb.xishu from t_caiwu ta,t_bumen tb " +
                "where ta.del='no' and ta.bumen_id=tb.id and ta.id not in " +
                "(select caiwu_id from t_caiwugongzi)";

        req.setAttribute("caiwuList", getCaiwuList(sql));
        req.getRequestDispatcher("admin/caiwu/caiwuList.jsp").forward(req, res);
    }

    private List getCaiwuList(String sql)
    {
        List caiwuList=new ArrayList();
        Object[] params={};
        DB mydb=new DB();
        try
        {
            mydb.doPstm(sql, params);
            ResultSet rs=mydb.getRs();
            while(rs.next())
            {
                TCaiwu caiwu=new TCaiwu();
                caiwu.setId(rs.getInt("id"));
                caiwu.setBumen_id(rs.getInt("bumen_id"));
                caiwu.setBianhao(rs.getString("bianhao"));
                caiwu.setLoginpw(rs.getString("loginpw"));
                caiwu.setXingming(rs.getString("xingming"));
                caiwu.setXingbie(rs.getString("xingbie"));
                caiwu.setRuzhi(rs.getString("ruzhi"));
                caiwu.setBmmc(rs.getString("bmmc"));
                caiwu.setXishu(rs.getDouble("xishu"));
                caiwuList.add(caiwu);
            }
            rs.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        mydb.closed();
        return caiwuList;
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
