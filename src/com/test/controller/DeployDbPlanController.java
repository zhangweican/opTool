package com.test.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.leweiyou.tools.date.DateUtil;
import com.test.dao.entry.DeployDbPlan;
import com.test.dao.entry.DeployDbPlanExample;
import com.test.dao.entry.DeployDbPlanExample.Criteria;
import com.test.service.DeployDbPlanService;
import com.test.util.SVNUtil;

@Controller
@RequestMapping("/deployDbPlan")
public class DeployDbPlanController {
	private static Logger logger = Logger.getLogger(DeployDbPlanController.class);
	@Autowired
	private DeployDbPlanService deployDbPlanService;
	
	@RequestMapping("/list")
	public String list(DeployDbPlan deployDbPlan,HttpServletRequest request,HttpServletResponse response){
		try {
			DeployDbPlanExample example = new DeployDbPlanExample();
			example.setOrderByClause("creatTime desc");
			if(deployDbPlan != null){
				
				Criteria c = example.createCriteria();
				//`version`  varchar(128) NOT NULL COMMENT '版本' ,
				//`dbName`  varchar(128) NOT NULL COMMENT '库名' ,
				//`isDoDeployDB`  int(1) NOT NULL DEFAULT 0 COMMENT '是否执行在开发DB(0:默认，1，待执行，2，已执行）' ,
				//`isDoTestDB`  int(1) NOT NULL DEFAULT 0 COMMENT '是否执行在测试DB(0:默认，1，待执行，2，已执行）' ,
				//`isDoPlatformDB`  int(1) NOT NULL DEFAULT 0 COMMENT '是否执行在预发布DB(0:默认，1，待执行，2，已执行）' ,
				//`isDoProductDB`  int(1) NOT NULL DEFAULT 0 COMMENT '是否执行在生成DB(0:默认，1，待执行，2，已执行）' ,
				//`title`  varchar(255) NOT NULL COMMENT '标题' ,
				if(StringUtils.isNotEmpty(deployDbPlan.getVersion())){
					c.andVersionEqualTo(deployDbPlan.getVersion());
				}
				if(StringUtils.isNotEmpty(deployDbPlan.getDbName())){
					c.andDbNameEqualTo(deployDbPlan.getDbName());
				}
				if(StringUtils.isNotEmpty(deployDbPlan.getTitle())){
					c.andTitleLike("%" + deployDbPlan.getTitle() + "%");
				}
				if(deployDbPlan.getIsDoDeployDB() != null && deployDbPlan.getIsDoDeployDB() != 0){
					c.andIsDoDeployDBEqualTo(deployDbPlan.getIsDoDeployDB());
				}
				if(deployDbPlan.getIsDoTestDB() != null && deployDbPlan.getIsDoTestDB() != 0){
					c.andIsDoTestDBEqualTo(deployDbPlan.getIsDoTestDB());
				}
				if(deployDbPlan.getIsDoPlatformDB() != null && deployDbPlan.getIsDoPlatformDB() != 0){
					c.andIsDoPlatformDBEqualTo(deployDbPlan.getIsDoPlatformDB());
				}
				if(deployDbPlan.getIsDoProductDB() != null && deployDbPlan.getIsDoProductDB() != 0){
					c.andIsDoProductDBEqualTo(deployDbPlan.getIsDoProductDB());
				}
				if(deployDbPlan.getIsDelete() != null){
					c.andIsDeleteEqualTo(deployDbPlan.getIsDelete());
				}else{
					c.andIsDeleteEqualTo(0);
				}
			}
			
			List<DeployDbPlan> list = deployDbPlanService.list(example );
			request.setAttribute("list", list);
			request.setAttribute("deployDbPlan", deployDbPlan);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Errir:" ,e);
		}
		
		return "deployDbPlan/list";
	}
	
	@RequestMapping("/preInsetUpdate")
	public String preInsetUpdate(HttpServletRequest request,HttpServletResponse response){
		try {
			String id = request.getParameter("id");
			if(StringUtils.isNotEmpty(id)){
				DeployDbPlan deployDbPlan = deployDbPlanService.get(Long.valueOf(id));
				request.setAttribute("deployDbPlan", deployDbPlan);
			}else{
				request.setAttribute("deployDbPlan", null);
			}
			//List<String> versions = SVNUtil.listEntries(SVNUtil.getConnection(), "/Development/IDC/branches/");
			//request.setAttribute("versions", versions);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Errir:" ,e);
		}
		
		return "deployDbPlan/insert";
	}
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		try {
			String id = request.getParameter("id");
			deployDbPlanService.delete(Long.valueOf(id));
			request.setAttribute("msg", "操作成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Errir:" ,e);
			request.setAttribute("msg", "操作失败");
		}
		try {
			request.getRequestDispatcher("list").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/insertUpdate")
	public String insertUpdate(DeployDbPlan deployDbPlan,HttpServletRequest request,HttpServletResponse response){
		try {
			String msg = "";
			if(deployDbPlan.getId() != null){
				DeployDbPlan old = deployDbPlanService.get(deployDbPlan.getId());
				deployDbPlan.setCreatTime(old.getCreatTime());
				if(old.getIsDoDeployDB() == 2 && deployDbPlan.getIsDoDeployDB() != 2){
					deployDbPlan.setIsDoDeployDB(old.getIsDoDeployDB());
					msg += "，开发库已经执行不能修改回其他状态,";
				}
				if(old.getIsDoTestDB() == 2 && deployDbPlan.getIsDoTestDB() != 2){
					deployDbPlan.setIsDoTestDB(old.getIsDoTestDB());
					msg += "，测试库已经执行不能修改回其他状态,";
				}
				if(old.getIsDoPlatformDB() == 2 && deployDbPlan.getIsDoPlatformDB() != 2){
					deployDbPlan.setIsDoPlatformDB(old.getIsDoPlatformDB());
					msg += "，预发布库已经执行不能修改回其他状态,";
				}
				if(old.getIsDoProductDB() == 2 && deployDbPlan.getIsDoProductDB() != 2){
					deployDbPlan.setIsDoProductDB(old.getIsDoProductDB());
					msg += "，生成库已经执行不能修改回其他状态,";
				}
				deployDbPlan.setIsDelete(old.getIsDelete());
				deployDbPlanService.update(deployDbPlan);
			}else{
				deployDbPlan.setIsDelete(0);
				deployDbPlan.setCreatTime(DateUtil.getCurrentTime());
				deployDbPlanService.insert(deployDbPlan);
				Cookie cookie = new Cookie("addUser", deployDbPlan.getAddUser());
				cookie.setMaxAge(Integer.MAX_VALUE);
				response.addCookie(cookie);
			}
			request.setAttribute("msg", "操作成功!" + msg);
		} catch (Exception e) {
			request.setAttribute("msg", "操作失败");
			e.printStackTrace();
			logger.error("Errir:" ,e);
		}
		
		return "deployDbPlan/insert";
	}
	
	@RequestMapping("/flag")
	@ResponseBody
	public Integer flag(String ids,Integer f,HttpServletRequest request,HttpServletResponse response){
		try {
			for(String id : ids.split(",")){
				DeployDbPlan old = deployDbPlanService.get(Long.valueOf(id));
				if(f == 1){
					if(old.getIsDoDeployDB() == 0){
						old.setIsDoDeployDB(1);
					}
				}else if(f == 2){
					if(old.getIsDoTestDB() == 0){
						old.setIsDoTestDB(1);
					}
				}else if(f == 3){
					if(old.getIsDoPlatformDB() == 0){
						old.setIsDoPlatformDB(1);
					}
				}else if(f == 4){
					if(old.getIsDoProductDB() == 0){
						old.setIsDoProductDB(1);
					}
				}
				deployDbPlanService.update(old);
			}
			return 0;
		} catch (Exception e) {
			request.setAttribute("msg", "操作失败");
			e.printStackTrace();
			logger.error("Errir:" ,e);
		}
		return -1;
	}
	@RequestMapping("/flagOK")
	@ResponseBody
	public Integer flagOK(String ids,Integer f,HttpServletRequest request,HttpServletResponse response){
		try {
			for(String id : ids.split(",")){
				DeployDbPlan old = deployDbPlanService.get(Long.valueOf(id));
				if(f == 1){
					if(old.getIsDoDeployDB() == 1){
						old.setIsDoDeployDB(2);
					}
				}else if(f == 2){
					if(old.getIsDoTestDB() == 1){
						old.setIsDoTestDB(2);
					}
				}else if(f == 3){
					if(old.getIsDoPlatformDB() == 1){
						old.setIsDoPlatformDB(2);
					}
				}else if(f == 4){
					if(old.getIsDoProductDB() == 1){
						old.setIsDoProductDB(2);
					}
				}
				deployDbPlanService.update(old);
			}
			return 0;
		} catch (Exception e) {
			request.setAttribute("msg", "操作失败");
			e.printStackTrace();
			logger.error("Errir:" ,e);
		}
		return -1;
	}
	@RequestMapping("/getVersions")
	@ResponseBody
	public JSONArray getVersions(){
		JSONArray ja = new JSONArray();
		try {
			List<String> versions = SVNUtil.listEntries(SVNUtil.getConnection(), "/Development/IDC/branches/");
			if(CollectionUtils.isNotEmpty(versions)){
				for(String s : versions){
					JSONObject jo = new JSONObject();
					jo.put("version", s);
					ja.add(jo);
				}
			}
			return ja;
		} catch (Exception e) {
			logger.error("链接失败",e);
		}
		return new JSONArray();
	}
}
