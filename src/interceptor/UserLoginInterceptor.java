package interceptor;

import controller.UserLoginAction;
import controller.RegisterAction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

public class UserLoginInterceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation arg0) throws Exception {

        if (arg0.getAction().getClass().getName().equals(UserLoginAction.class.getName()) ||
                arg0.getAction().getClass().getName().equals(RegisterAction.class.getName())) {
            return arg0.invoke();
        }

        Map session = arg0.getInvocationContext().getSession();
        if (session.get("user") == null) {
            return UserLoginAction.LOGIN;
        } else {
            return arg0.invoke();
        }
    }
}
