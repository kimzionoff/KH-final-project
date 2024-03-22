package com.myedumyselect.common.util;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;

public interface SessionCheckService {

	String isAcademySessionCheck(@SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO, Model model, String alertMsg);
	String isAcademySessionCheck(@SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO, Model model);

	String isPersonalSessionCheck(@SessionAttribute("personalLogin") PersonalLoginVO personalLoginVO, Model model, String alertMsg);
	String isPersonalSessionCheck(@SessionAttribute("personalLogin") PersonalLoginVO personalLoginVO, Model model);

}