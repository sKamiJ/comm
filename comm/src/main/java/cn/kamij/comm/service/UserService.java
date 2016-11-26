package cn.kamij.comm.service;

import cn.kamij.comm.model.User;

public interface UserService {
	// 应用UserMapper所提供的功能生成新功能并向上提供
	User getUserById(Integer id);

	Integer getIdByLoginName(String loginName);

	Boolean login(String loginName, String password);
}
