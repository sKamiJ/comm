package cn.kamij.comm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.kamij.comm.mapper.UserMapper;
import cn.kamij.comm.model.User;
import cn.kamij.comm.service.UserService;

//服务名
@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;

	public User getUserById(Integer id) {
		return this.userMapper.selectByPrimaryKey(id);
	}

	public Integer getIdByLoginName(String loginName) {
		return userMapper.selectIdByLoginName(loginName);
	}

	public Boolean login(String loginName, String password) {
		return password.equals(userMapper.selectPasswordByLoginName(loginName));
	}

}
