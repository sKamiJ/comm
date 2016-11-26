package cn.kamij.comm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.kamij.comm.model.User;
import cn.kamij.comm.service.UserService;

@Controller
// 在浏览器地址中项目名后添加该字符串表示进入该控制器
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;

	// 在浏览器地址中控制器名后添加该字符串表示进入该方法
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request, Model model) {
		// 获取浏览器地址中的元素（样例地址:http://localhost:8080/SSM_Framework/user/showUser?id=0000000001）
		Integer userId = Integer.valueOf(request.getParameter("id"));
		// 使用该服务
		User user = this.userService.getUserById(userId);
		// 向网页中添加对象供网页使用
		model.addAttribute("user", user);
		// 返回网页名，即该方法使用该网页（要与Deployed Resources-webapp-WEB-INF-jsp中jsp文件名一致）
		return "showUser";
	}

	// 在浏览器地址中控制器名后添加该字符串表示进入该方法
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		return "userLogin";
	}

	@RequestMapping("/doLogin")
	// 返回结果不会被解析为跳转路径
	@ResponseBody
	public Boolean doLogin(HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		Boolean result = userService.login(loginName, request.getParameter("password"));
		// 成功登录
		if (result == true) {
			request.getSession().setAttribute("userId", userService.getIdByLoginName(loginName));
		}
		return result;
	}

	// 在浏览器地址中控制器名后添加该字符串表示进入该方法
	@RequestMapping("/homepage")
	public String homepage(HttpServletRequest request) {
		return "userHomepage";
	}

	@RequestMapping("/quit")
	// 返回结果不会被解析为跳转路径
	@ResponseBody
	public void quit(HttpServletRequest request) {
		request.getSession().removeAttribute("userId");
	}
}