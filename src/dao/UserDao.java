package dao;

import model.User;
import java.util.Iterator;

public class UserDao extends Dao {

    protected static String table = "user";  // 数据库表名

    protected static Class class_type = User.class; // 数据模型的class

    public UserDao(){
        super(table, class_type);
    }

    public static void main(String [] args) throws Exception {
        UserDao dao = new UserDao();

//        List<Object> list = dao.paginate(1, 20);
//        for(Object o: list){
//            User u = (User)o;
//            System.out.println(u.getUsername());
//        }

//        User user = new User();  // 创建模型对象 主键不需要设置　由ORM维护
//        user.setSex("w");
//        user.setUser_identity("editor");
//        user.setUsername("sj");
//        dao.add(user); // 存储到数据库

        /*
         * ORM的查询
         * 当前只支持单表查询
         * 支持单表的多条件查询
         */

        // 查找到id等于0的第一个对象
        User user1 = (User)dao.filter("id", ">2").filter("id", "<5").first();
        System.out.println(user1.getUsername());


//         在id大于-1的对象中查找用户名为 sj的对象
        User user2 = (User)dao.filter("id", ">-1").filter("username", "='sj'").first();
        System.out.println(user2.getUsername());


        //找到所有id大于-1的对象并输出用户名
        Iterator iter = dao.filter("id", ">1").filter("id", "<10").all();
        while (iter.hasNext()){
            User u = (User)iter.next();
            System.out.println(u.getUsername());
        }
    }
}