*** Settings ***
Library           Selenium2Library

*** Variables ***
${AIOS首页-导航栏-云文档}     XPATH=//*[@id="app"]/div[1]/section/div[3]/div/div[1]/div[2]
${AIOS云文档-搜索框}     XPATH=//input[@placeholder="请输入搜索关键词"]
${AIOS云文档-搜索框-取消按钮}     XPATH=//img[@class="iconClosed"]
${AIOS云文档-搜索框-输入框}     XPATH=//input[@placeholder="请输入搜索关键词"]
${AIOS云文档-我的空间tips}     XPATH=//img[@class="popper-icon el-tooltip__trigger el-tooltip__trigger"]

${AIOS云文档-我的空间tips}     XPATH=//img[@class="popper-icon el-tooltip__trigger el-tooltip__trigger"]

${AIOS云文档-上传文件框}     XPATH=//div[text()="请上传docx等格式文件"]
${AIOS云文档-上传文件框-上传文件}     XPATH=//span[text()="上传文件"]
${AIOS云文档-上传文件框-上传文件夹}     XPATH=//span[text()="上传文件夹"]

${AIOS云文档-新建文件框}     XPATH=//div[text()="您可以手动创建文件"]
${AIOS云文档-新建文件框-新建文件}     XPATH=//span[text()="新建文档"]
${AIOS云文档-新建文件框-新建文件夹}     XPATH=//span[text()="新建文件夹"]
${AIOS云文档-新建文件框-新建文件夹-名称输入框}     XPATH=//input[@placeholder="请输入名称"]
${AIOS云文档-新建文件框-新建文件夹-描述输入框}     XPATH=//input[@placeholder="请输入描述"]
${AIOS云文档-新建文件框-新建文件夹-确认按钮}     XPATH=//button[@placeholder="el-button el-button--primary el-button--default"]/span
${AIOS云文档-新建文件框-新建文件夹-取消按钮}     XPATH=//button[@placeholder="el-button el-button--default"]/span












