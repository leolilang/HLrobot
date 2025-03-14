*** Settings ***
Library           Selenium2Library

*** Variables ***
${AIOS首页-logo}    XPATH=//img[@class='logo']
${AIOS首页-搜索}      XPATH=//div[@class='tl-item message']
${AIOS首页-搜索输入框}    XPATH=//input[@placeholder='请输入搜索关键词']
${AIOS首页-搜索输入框-取消按钮}    XPATH=//img[@class='iconClosed']

${AIOS首页-用户头像}    XPATH=//img[@class='user-img']
${AIOS首页-账号设置}    XPATH=//span[text()='账号设置']
${AIOS首页-秘钥设置}    XPATH=//span[text()='秘钥设置']
${AIOS首页-退出登录}    XPATH=//div[text()=' 退出登录 ']
${AIOS首页-导航栏-首页}      XPATH=//*[@id="app"]/div[1]/section/div[3]/div/div[1]/div[1]

${AIOS首页-拖动上传框}    XPATH=//div[@class="el-upload-dragger"]
${AIOS首页-拖动上传框-input}    XPATH=//input[@name="el-upload_mapinput"]

${AIOS首页-上传文件}    XPATH=//div[text()="请上传docx格式文件"]
${AIOS首页-上传文件-上传文件}    XPATH=//span[text()="上传文件"]
${AIOS首页-上传文件-上传文件夹}    XPATH=//span[text()="上传文件夹"]
${AIOS首页-上传文件-上传文件-input}    XPATH=//input[@name="el-upload_one"]
${AIOS首页-上传文件-上传文件夹-input}    XPATH=//input[@name="el-upload_two"]

${AIOS首页-新建文件}    XPATH=//div[text()="您可以手动创建文件"]
${AIOS首页-新建文件-新建文档}    XPATH=//span[text()="新建文档"]
${AIOS首页-新建文件-新建文件夹}    XPATH=//span[text()="新建文件夹"]
${AIOS首页-新建文件-新建文件夹-名称}    XPATH=//input[@placeholder="请输入名称"]
${AIOS首页-新建文件-新建文件夹-描述}    XPATH=//input[@placeholder="请输入描述"]
${AIOS首页-新建文件-新建文件夹-确认}    XPATH=//span[text()=" 确认 "]
${AIOS首页-云文档}     XPATH=//div[text()="您可以管理您的文件"]

${AIOS首页-上传弹窗-上传成功}     XPATH=//p[text()="全部上传成功"]
${AIOS首页-上传弹窗-上传成功-关闭}     XPATH=//img[@class="iconClosed"]








