package com.myedumyselect.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.login.dao.AdminLoginDao;
import com.myedumyselect.admin.login.vo.AdminLoginVO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	@Setter(onMethod_ = @Autowired)
	private AdminLoginDao adminLoginDao;

	@Override
	public AdminLoginVO loginProcess(AdminLoginVO login) {
		AdminLoginVO adminLogin = adminLoginDao.loginProcess(login);
		return adminLogin;
	}

	@Override
	public int updateAdminInfo(AdminLoginVO newAdminInfo) {
		int result = 0;
		adminLoginDao.updateAdminInfo(newAdminInfo);
		return result;
	}

	@Override
	public int updateAdminPasswd(AdminLoginVO checkPassword) {
		int result = 0;
		result = adminLoginDao.updateAdminPasswd(checkPassword);
		return result;
	}

}
