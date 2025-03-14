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
