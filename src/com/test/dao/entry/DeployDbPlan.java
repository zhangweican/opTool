package com.test.dao.entry;

import java.util.Date;

public class DeployDbPlan {
    /**<br/>
     * 字段: deploy_db_plan.id<br/>
     * 主键: 自动增长<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 19<br/>
     * 说明: 主键
     */
    private Long id;

    /**<br/>
     * 字段: deploy_db_plan.version<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 128<br/>
     * 说明: 版本
     */
    private String version;

    /**<br/>
     * 字段: deploy_db_plan.dbName<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 128<br/>
     * 说明: 库名
     */
    private String dbName;

    /**<br/>
     * 字段: deploy_db_plan.isDoDeployDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * 说明: 是否执行在开发DB(0:默认，1，待执行，2，已执行）
     */
    private Integer isDoDeployDB;

    /**<br/>
     * 字段: deploy_db_plan.isDoTestDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * 说明: 是否执行在测试DB(0:默认，1，待执行，2，已执行）
     */
    private Integer isDoTestDB;

    /**<br/>
     * 字段: deploy_db_plan.isDoPlatformDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * 说明: 是否执行在预发布DB(0:默认，1，待执行，2，已执行）
     */
    private Integer isDoPlatformDB;

    /**<br/>
     * 字段: deploy_db_plan.isDoProductDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * 说明: 是否执行在生成DB(0:默认，1，待执行，2，已执行）
     */
    private Integer isDoProductDB;

    /**<br/>
     * 字段: deploy_db_plan.addUser<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 255<br/>
     * 说明: 谁新增的(1:江金鹏，2：张伟灿，3：陈贤林，4赖雪丹)
     */
    private String addUser;

    /**<br/>
     * 字段: deploy_db_plan.title<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 255<br/>
     * 说明: 标题
     */
    private String title;

    /**<br/>
     * 字段: deploy_db_plan.isDelete<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * 说明: 是否删除
     */
    private Integer isDelete;

    /**<br/>
     * 字段: deploy_db_plan.creatTime<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 19<br/>
     * 说明: 创建日期
     */
    private Date creatTime;

    /**<br/>
     * 字段: deploy_db_plan.content<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 65535<br/>
     * 说明: 内容
     */
    private String content;

    /**
     * @return deploy_db_plan.id: 主键
     */
    public Long getId() {
        return id;
    }

    /**<br/>
     * 字段: deploy_db_plan.id<br/>
     * 主键: 自动增长<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 19<br/>
     * @param id: 主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return deploy_db_plan.version: 版本
     */
    public String getVersion() {
        return version;
    }

    /**<br/>
     * 字段: deploy_db_plan.version<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 128<br/>
     * @param version: 版本
     */
    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    /**
     * @return deploy_db_plan.dbName: 库名
     */
    public String getDbName() {
        return dbName;
    }

    /**<br/>
     * 字段: deploy_db_plan.dbName<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 128<br/>
     * @param dbName: 库名
     */
    public void setDbName(String dbName) {
        this.dbName = dbName == null ? null : dbName.trim();
    }

    /**
     * @return deploy_db_plan.isDoDeployDB: 是否执行在开发DB(0:默认，1，待执行，2，已执行）
     */
    public Integer getIsDoDeployDB() {
        return isDoDeployDB;
    }

    /**<br/>
     * 字段: deploy_db_plan.isDoDeployDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * @param isDoDeployDB: 是否执行在开发DB(0:默认，1，待执行，2，已执行）
     */
    public void setIsDoDeployDB(Integer isDoDeployDB) {
        this.isDoDeployDB = isDoDeployDB;
    }

    /**
     * @return deploy_db_plan.isDoTestDB: 是否执行在测试DB(0:默认，1，待执行，2，已执行）
     */
    public Integer getIsDoTestDB() {
        return isDoTestDB;
    }

    /**<br/>
     * 字段: deploy_db_plan.isDoTestDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * @param isDoTestDB: 是否执行在测试DB(0:默认，1，待执行，2，已执行）
     */
    public void setIsDoTestDB(Integer isDoTestDB) {
        this.isDoTestDB = isDoTestDB;
    }

    /**
     * @return deploy_db_plan.isDoPlatformDB: 是否执行在预发布DB(0:默认，1，待执行，2，已执行）
     */
    public Integer getIsDoPlatformDB() {
        return isDoPlatformDB;
    }

    /**<br/>
     * 字段: deploy_db_plan.isDoPlatformDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * @param isDoPlatformDB: 是否执行在预发布DB(0:默认，1，待执行，2，已执行）
     */
    public void setIsDoPlatformDB(Integer isDoPlatformDB) {
        this.isDoPlatformDB = isDoPlatformDB;
    }

    /**
     * @return deploy_db_plan.isDoProductDB: 是否执行在生成DB(0:默认，1，待执行，2，已执行）
     */
    public Integer getIsDoProductDB() {
        return isDoProductDB;
    }

    /**<br/>
     * 字段: deploy_db_plan.isDoProductDB<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * @param isDoProductDB: 是否执行在生成DB(0:默认，1，待执行，2，已执行）
     */
    public void setIsDoProductDB(Integer isDoProductDB) {
        this.isDoProductDB = isDoProductDB;
    }

    /**
     * @return deploy_db_plan.addUser: 谁新增的(1:江金鹏，2：张伟灿，3：陈贤林，4赖雪丹)
     */
    public String getAddUser() {
        return addUser;
    }

    /**<br/>
     * 字段: deploy_db_plan.addUser<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 255<br/>
     * @param addUser: 谁新增的(1:江金鹏，2：张伟灿，3：陈贤林，4赖雪丹)
     */
    public void setAddUser(String addUser) {
        this.addUser = addUser == null ? null : addUser.trim();
    }

    /**
     * @return deploy_db_plan.title: 标题
     */
    public String getTitle() {
        return title;
    }

    /**<br/>
     * 字段: deploy_db_plan.title<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 255<br/>
     * @param title: 标题
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * @return deploy_db_plan.isDelete: 是否删除
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**<br/>
     * 字段: deploy_db_plan.isDelete<br/>
     * 可空: false<br/>
     * 缺省: 0<br/>
     * 长度: 10<br/>
     * @param isDelete: 是否删除
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * @return deploy_db_plan.creatTime: 创建日期
     */
    public Date getCreatTime() {
        return creatTime;
    }

    /**<br/>
     * 字段: deploy_db_plan.creatTime<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 19<br/>
     * @param creatTime: 创建日期
     */
    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    /**
     * @return deploy_db_plan.content: 内容
     */
    public String getContent() {
        return content;
    }

    /**<br/>
     * 字段: deploy_db_plan.content<br/>
     * 可空: false<br/>
     * 缺省: <br/>
     * 长度: 65535<br/>
     * @param content: 内容
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}