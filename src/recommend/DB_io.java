package recommend;

import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DB_io {
    public static Connection conn = (Connection) DBUtil.getConnection();

    public static long[] getItemIdFromDB()
    {
        List<Long> ids = new ArrayList();


        String sql = "select distinct item_id from taste_preferences  order by item_id";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                long id = rs.getInt("item_id");
                ids.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        long[] items = ids.stream().mapToLong(t->t.longValue()).toArray();

        return items;

    }

    public static void deleteSimilarityIntoDb(){
        String sql0 = "delete from taste_item_similarity";
        try {
            PreparedStatement ps0 = conn.prepareStatement(sql0);
            ps0.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void saveSimilarityIntoDb(long leftId,List<Map.Entry<Long, Double>> similarityList){
       // System.out.println(""+leftId+":"+ similarityList);


        //插入新数据
        for(int i=0;i<similarityList.size();i++){
            System.out.println(""+leftId+":"+similarityList.get(i).getKey()+":"+similarityList.get(i).getValue());

            String sql = "insert into taste_item_similarity values (?,?,?)";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setLong(1,leftId);
                ps.setLong(2,similarityList.get(i).getKey());
                ps.setDouble(3,similarityList.get(i).getValue());
                ps.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
