package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.test.dao.DeployDbPlanMapper;
import com.test.dao.entry.DeployDbPlan;
import com.test.dao.entry.DeployDbPlanExample;

@Component
public class DeployDbPlanService {
	@Autowired
    private DeployDbPlanMapper deployDbPlanMapper;
    
	public int insert(DeployDbPlan record){
		return deployDbPlanMapper.insert(record);
	}
    public int update(DeployDbPlan record){
    	return deployDbPlanMapper.updateByPrimaryKeyWithBLOBs(record);
    }
    
	public List<DeployDbPlan> list(DeployDbPlanExample example) {
    	return deployDbPlanMapper.selectByExampleWithBLOBs(example);
	}
	public DeployDbPlan get(Long id) {
		return deployDbPlanMapper.selectByPrimaryKey(id);
		
	}
	public void delete(Long id) {
		DeployDbPlan dd = new DeployDbPlan();
		dd.setId(id);
		dd.setIsDelete(1);
		deployDbPlanMapper.updateByPrimaryKeySelective(dd);
	}
}