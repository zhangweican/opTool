package com.test.dao;

import com.test.dao.entry.DeployDbPlan;
import com.test.dao.entry.DeployDbPlanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeployDbPlanMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int countByExample(DeployDbPlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int deleteByExample(DeployDbPlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int insert(DeployDbPlan record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int insertSelective(DeployDbPlan record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    List<DeployDbPlan> selectByExampleWithBLOBs(DeployDbPlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    List<DeployDbPlan> selectByExample(DeployDbPlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    DeployDbPlan selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") DeployDbPlan record, @Param("example") DeployDbPlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int updateByExampleWithBLOBs(@Param("record") DeployDbPlan record, @Param("example") DeployDbPlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") DeployDbPlan record, @Param("example") DeployDbPlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(DeployDbPlan record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int updateByPrimaryKeyWithBLOBs(DeployDbPlan record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deploy_db_plan
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(DeployDbPlan record);
}