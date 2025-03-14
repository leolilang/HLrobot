*** Settings ***
Suite Setup       AIOS_login    ${URL}    ${browser_type}    ${username}    ${verification_code}
Suite Teardown    AIOS_logout
Library           Selenium2Library
Library           ../library/MyLibrary.py
Variables         ../config/config.py
Resource          ../userKeyword/common.resource
Resource          ../pageElements/login_element.resource
Resource          ../pageElements/homepage.resource

*** Test Cases ***

操作手册
    [Documentation]    登录成功后进入首页，点击首页右上角的？图标打开操作手册，并验证是否在新标签页中打开
    [Tags]             UI-Test
    Click Element    ${AIOS首页-logo}
    # 等待页面加载
    Wait Until Page Contains Element    ${homepage_question_icon}
    # 点击首页右上角的？图标
    Click Element    ${homepage_question_icon}
    # 获取当前所有窗口句柄
    ${all_windows}    Get Window Handles
    # 切换到新打开的窗口
    Switch Window    ${all_windows}[1]
    # 验证是否成功切换到新窗口，可通过新窗口的标题或URL来判断
    ${new_window_title}    Get Title
    ${new_window_url}    Get Location
    Should Not Be Equal    ${new_window_title}    ${EMPTY}
    Should Not Be Equal    ${new_window_url}    ${EMPTY}
    # 关闭新窗口
    Close Window
    # 切换回原来的窗口
    Switch Window    ${all_windows}[0]

拖拽上传-正常上传
    Click Element    ${AIOS首页-logo}
    Sleep    500ms
    Mouse Over    ${AIOS首页-拖动上传框}
    Sleep    500ms
    Choose File    ${AIOS首页-拖动上传框-input}    ${EXECDIR}/data/file/白藜芦醇通过调控信号通路治疗膝骨关节炎的研究进展.docx
    Wait Until Element Is Visible    ${AIOS首页-上传弹窗-上传成功}
    Click Element    ${AIOS首页-上传弹窗-上传成功-关闭}
    Sleep    500ms

拖拽上传-不支持的格式
    Click Element    ${AIOS首页-logo}
    Sleep    500ms
    Mouse Over    ${AIOS首页-拖动上传框}
    Sleep    500ms
    Choose File    ${AIOS首页-拖动上传框-input}    ${EXECDIR}/data/file/aewd.png
    Wait Until Element Is Visible    XPATH=//p[text()='当前仅支持拖拽上传DOCX格式的文件']
    Sleep    500ms

上传文件-正常上传
    Click Element    ${AIOS首页-logo}
    Sleep    1s
    Mouse Over    ${AIOS首页-上传文件}
    Sleep    1s
    log    *************************
    log    ${EXECDIR}/data/file/外泌体在关节软骨再生与软骨下骨代谢平衡中的研究进展.docx
    log    ${TEMPDIR}
    log    ${CURDIR}
    log    *************************
    Choose File    ${AIOS首页-上传文件-上传文件-input}    ${EXECDIR}/data/file/外泌体在关节软骨再生与软骨下骨代谢平衡中的研究进展.docx
    Wait Until Element Is Visible    ${AIOS首页-上传弹窗-上传成功}
    Click Element    ${AIOS首页-上传弹窗-上传成功-关闭}
    Sleep    500ms

上传文件-不支持的格式
    Click Element    ${AIOS首页-logo}
    Sleep    1s
    Mouse Over    ${AIOS首页-上传文件}
    Sleep    1s
    log    *************************
    log    ${EXECDIR}/data/file/aewd.png
    log    ${TEMPDIR}
    log    ${CURDIR}
    log    *************************
    Choose File    ${AIOS首页-上传文件-上传文件-input}    ${EXECDIR}/data/file/aewd.png
    Wait Until Element Is Visible    XPATH=//p[text()='当前仅支持上传DOCX格式的文件']
    Sleep    1s

上传文件夹-正常上传
    Click Element    ${AIOS首页-logo}
    Sleep    1s
    Mouse Over    ${AIOS首页-上传文件}
    Sleep    1s
    log    *************************
    log    ${EXECDIR}/data/file
    log    ${TEMPDIR}
    log    ${CURDIR}
    log    *************************
    Choose File    XPATH=//input[@name="el-upload_two"]    ${EXECDIR}/data/file
    Wait Until Element Is Visible    ${AIOS首页-上传弹窗-上传成功}
    Click Element    ${AIOS首页-上传弹窗-上传成功-关闭}
    Sleep    500ms

创建文件夹
    Click Element    ${AIOS首页-logo}
    Sleep    1s
    Mouse Over    ${AIOS首页-新建文件}
    Click Element    ${AIOS首页-新建文件-新建文件夹}
    Sleep    500ms
    Input Text    ${AIOS首页-新建文件-新建文件夹-名称}    UI--创建文件夹
    Input Text    ${AIOS首页-新建文件-新建文件夹-描述}    UI--创建文件夹--描述字段
    Click Element    ${AIOS首页-新建文件-新建文件夹-确认}
    Wait Until Element Is Visible    XPATH=//p[text()='新建文件夹成功']    timeout=500ms
    Sleep    1s
