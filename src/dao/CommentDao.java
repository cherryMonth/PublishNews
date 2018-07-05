package dao;

import model.Comment;

public class CommentDao extends Dao {
    protected static String table = "news";
    protected static Class class_type = Comment.class;

    public CommentDao() {
        super(table, class_type);
    }
}
