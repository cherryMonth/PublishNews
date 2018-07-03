package dao;

import model.Comment;

public class CommentDao extends Dao {
    protected static String table = "news";
    protected static String class_type = Comment.class.getName();

    public CommentDao() {
        super(table, class_type);
    }

}
