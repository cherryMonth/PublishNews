package dao;

import model.User;
import java.util.Iterator;
import java.util.List;

public class UserDao extends Dao {

    protected static String table = "user";
    protected static String class_type = User.class.getName();

    public UserDao(){
        super(table, class_type);
    }

    public static void main(String [] args) throws Exception {
        UserDao dao = new UserDao();
        User user = new User();
        user.setSex("w");
//        user.setId();
        user.setUser_identity("editor");
        user.setUsername("宋s2建");
        dao.add(user);
        Iterator iter = dao.filter("id", ">1").filter("username", "='宋建'").all();
        while (iter.hasNext()){
            User u = (User)iter.next();
            System.out.println(u.getUsername());
        }
    }
}