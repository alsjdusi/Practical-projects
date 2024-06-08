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
import com.orm.TBaoxiao;


public class baoxiao_servlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");

        if (type.endsWith("baoxiaoAdd")) {
            baoxiaoAdd(req, res);
        }
        if (type.endsWith("baoxiaoList")) {
            baoxiaoList(req, res);
        }
        if(type.endsWith("baoxiaoDel"))
        {
            baoxiaoDel(req, res);
        }
    }

    public void baoxiaoAdd(HttpServletRequest req, HttpServletResponse res) {
        String name = req.getParameter("name");
        String bumen = req.getParameter("bumen");
        String date = req.getParameter("date");
        String bxmingcheng = req.getParameter("bxmingcheng");
        String del="no";
        String money = req.getParameter("money");
        String cause = req.getParameter("cause");
        String sql = "insert into t_baoxiao (name,bumen,date,bxmingcheng,del,money,cause) " +
                "values(?,?,?,?,?,?,?)";
        Object[] params = {name, bumen, date, bxmingcheng, del,money, cause};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "操作成功");
       // req.setAttribute("path", "baoxiao?type=baoxiaoAdd");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void baoxiaoList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String sql = "select * from t_baoxiao where del='no'";

        req.setAttribute("baoxiaoList", getbaoxiaoList(sql));
        req.getRequestDispatcher("admin/baoxiao/baoxiaoList.jsp").forward(req, res);
    }

    private List getbaoxiaoList(String sql) {
        List baoxiaoList = new ArrayList();
        Object[] params = {};
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, params);
            ResultSet rs = mydb.getRs();
            while (rs.next()) {
                TBaoxiao baoxiao = new TBaoxiao();
                baoxiao.setId(rs.getInt("id"));
                baoxiao.setName(rs.getString("name"));
                baoxiao.setBumen(rs.getString("bumen"));
                baoxiao.setDate(rs.getString("date"));
                baoxiao.setBxmingcheng(rs.getString("bxmingcheng"));
                baoxiao.setMoney(rs.getString("money"));
                baoxiao.setCause(rs.getString("cause"));
                baoxiaoList.add(baoxiao);
            }
            System.out.println(baoxiaoList);

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();
        return baoxiaoList;
    }

    public void baoxiaoDel(HttpServletRequest req,HttpServletResponse res)
    {
        String sql="update t_baoxiao set del='yes' where id="+Integer.parseInt(req.getParameter("id"));

        Object[] params={};
        DB mydb=new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "操作成功");
        req.setAttribute("path", "baoxiao?type=baoxiaoList");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void dispatch(String targetURI, HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
        try {
            dispatch.forward(request, response);
            return;
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void destroy() {

    }
}
