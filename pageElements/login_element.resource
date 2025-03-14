*** Settings ***
Library           Selenium2Library

*** Variables ***
${AIOS登录页-首行logo}    XPATH=//*[@id="app"]/div[1]/div/img    # AIOS登录页-首行logo
${AIOS登录页-立即登录}    XPATH=//span[text() = '立即登录']    # 登录页-立即登录按钮
${解螺旋登录页-首行logo}    XPATH=//*[@id="app"]/div[1]/div/div/img    # 解螺旋登录页-首行AIOS的logo
${解螺旋登录页-密码登录-账号输入框}    XPATH=//input[@placeholder="请输入手机号或邮箱"]    # 解螺旋登录页-密码登录-账号输入框
${解螺旋登录页-密码登录-密码输入框}    XPATH=//input[@placeholder="请输入密码"]    # 解螺旋登录页-密码登录-账号输入框
${解螺旋登录页-密码登录-查看密码}    XPATH=//img[@class="active"]    # 解螺旋登录页-密码登录-查看密码
${解螺旋登录页-密码登录-记住密码-勾选}    XPATH=//span[@class="el-checkbox__input is-checked"]    # 解螺旋登录页-密码登录-记住密码勾选上
${解螺旋登录页-密码登录-记住密码-未勾选}    XPATH=//span[@class="el-checkbox__input"]
${解螺旋登录页-密码登录-找回密码}    XPATH=//a[text()="找回密码?"]
${解螺旋登录页-密码登录-登录按钮}    XPATH=//div[@class="code-box"]/div[4]/button
${解螺旋登录页-密码登录-cookie确认按钮}    XPATH=//button[@class="confirm-btn"]
${解螺旋登录页-验证码登录-按钮}    XPATH=//span[text()="验证码登录"]
${解螺旋登录页-验证码登录-手机号输入框}    XPATH=//input[@placeholder="请输入手机号"]
${解螺旋登录页-验证码登录-获取验证码}    XPATH=//a[text()="获取验证码"]
${解螺旋登录页-验证码登录-验证码输入框}    XPATH=//input[@placeholder="请输入验证码"]
