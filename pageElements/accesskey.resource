*** Settings ***
Library           Selenium2Library

*** Variables ***
${AIOS首页-密钥设置}    XPATH=//span[text()='密钥设置']
${密钥设置-导航}    XPATH=//*[@id="app"]/div[1]/section/div[3]/div/div/div
${密钥设置-tips}    XPATH=//img[@class="password-detail el-tooltip__trigger el-tooltip__trigger"]
${密钥设置-创建AccessKey}    XPATH=//p[@class="create-access-key"]
${密钥设置-创建AccessKey-置灰}    XPATH=//p[@class="create-access-key set-grey-btn"]
${密钥设置-选择手机号}    XPATH=//p[text()="手机号验证"]
${密钥设置-选择邮箱}    XPATH=//p[text()="邮箱验证"]
${密钥设置-获取验证码}    XPATH=//button[@class="code-btn"]
${密钥设置-输入验证码}    XPATH=//input[@placeholder="请输入验证码"]

${密钥设置-验证-下一步}    XPATH=//*[@class="el-button el-button--primary el-button--default primary-btn"]/span

${密钥设置-选择文件夹-搜索}    XPATH=//input[@placeholder="搜索文件夹名称"]
${密钥设置-选择文件夹-搜索}    XPATH=//input[@placeholder="搜索文件夹名称"]
${密钥设置-选择文件夹-选择}    XPATH=//span[text()="UI--绑定密钥文件夹"]
${密钥设置-选择文件夹-下一步}    XPATH=//*[@class="el-button el-button--primary el-button--default primary-btn"]/span
${密钥设置-选择文件夹-上一步}    XPATH=//p[text()=" 上一步 "]


${密钥设置-完成-完成}    XPATH=//*[@style="" and @class="el-button el-button--primary el-button--default primary-btn"]/span
${密钥设置-完成-上一步}    XPATH=//span[text()=" 上一步 "]
${密钥设置-完成-复制}    XPATH=//img[@style="width: 14px; height: 14px; margin-left: 6px;"]
${密钥设置-完成-文本已复制}    XPATH=//p[text()="文本已复制"]
${密钥设置-完成-密钥创建成功}    XPATH=//p[text()="密钥创建成功"]

${密钥设置-列表-操作}    XPATH=//i[@class='el-icon']
${密钥设置-列表-编辑}    XPATH=//span[text()="编辑"]
${密钥设置-列表-编辑-下一步}    XPATH=//button[@class="el-button el-button--primary el-button--default primary-btn"]/span
${密钥设置-列表-编辑-确认}    XPATH=//button[@class="el-button el-button--primary el-button--default primary-btn"]/span
${密钥设置-列表-编辑成功}    XPATH=//p[text()="修改授权文件夹成功"]

${密钥设置-列表-已禁用}    XPATH=//tr[@class='el-table__row'][1]/td[2]/div/p
${密钥设置-列表-禁用}    XPATH=//span[text()="禁用"]
${密钥设置-列表-禁用成功}    XPATH=//p[text()="密钥状态更改成功"]

${密钥设置-列表-启用}    XPATH=//span[text()="启用"]
${密钥设置-列表-启用成功}    XPATH=//p[text()="密钥状态更改成功"]

${密钥设置-列表-删除}    XPATH=//span[text()="删除"]
${密钥设置-列表-删除-下一步}    XPATH=//button[@class="el-button el-button--primary el-button--default primary-btn"]/span
${密钥设置-列表-删除-确认}    XPATH=//button[@class="el-button el-button--primary el-button--default primary-btn"]/span
${密钥设置-列表-删除成功}    XPATH=//p[text()="密钥删除成功"]

