package model;

public class User {
    private int id = -1;
    private String username;
    private String sex;
    private String user_identity;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String password;

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setUser_identity(String user_identity) {
        this.user_identity = user_identity;
    }

    public int getId() {
        return id;

    }

    public String getUsername() {
        return username;
    }

    public String getSex() {
        return sex;
    }

    public String getUser_identity() {
        return user_identity;
    }
}
