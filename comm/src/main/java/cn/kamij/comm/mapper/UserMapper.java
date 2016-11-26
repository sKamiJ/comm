package cn.kamij.comm.mapper;

import cn.kamij.comm.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    
    String selectPasswordByLoginName(String loginName);
    
    Integer selectIdByLoginName(String loginName);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}