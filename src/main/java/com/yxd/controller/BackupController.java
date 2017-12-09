package com.yxd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yxd.util.BackupUtil;

@Controller
@RequestMapping("/backup")
public class BackupController {
	@ResponseBody
	@RequestMapping("/backup.do")
	public String backup() {
		BackupUtil.backup();
		return "1";
	}
}
