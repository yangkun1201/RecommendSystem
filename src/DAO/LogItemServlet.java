package DAO;

import util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LogItemServlet")
public class LogItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = (Connection) DBUtil.getConnection();
        String item_id0 = request.getParameter("item_id");
        String username = request.getParameter("username");
        int item_id = Integer.parseInt(item_id0);
        int user_id = -1;
        if(!username.equals("")){
            //查询username 对应的id
            String sql0 = "select * from user where username = ?";
            try {
                PreparedStatement ps0 = conn.prepareStatement(sql0);
                ps0.setString(1,username);
                ResultSet rs = ps0.executeQuery();

                while(rs.next()){
                    user_id = rs.getInt("id");
                }

                //查询当前item是否已存在
                boolean notInDb = true;

                String sql2 = "select * from taste_preferences where item_id = ? and user_id = ?";
                PreparedStatement ps2 = conn.prepareStatement(sql2);
                ps2.setInt(1,item_id);
                ps2.setInt(2,user_id);
                ResultSet rs2 = ps2.executeQuery();

                while(rs2.next()){
                    notInDb = false;
                }
                //插入userid itemid
                if(notInDb){
                    String sql1 = "insert into taste_preferences values(?,?)";
                    PreparedStatement ps1 = conn.prepareStatement(sql1);
                    ps1.setInt(1,user_id);
                    ps1.setInt(2,item_id);
                    ps1.execute();
                    System.out.println("watch news :"+item_id+" : "+user_id);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
