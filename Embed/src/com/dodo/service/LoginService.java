package com.dodo.service;

import java.util.List;

import com.dodo.entity.TbUser;

public interface LoginService {

	String findUser(TbUser tbUser)throws Exception;

	String addHost()throws Exception;


}
