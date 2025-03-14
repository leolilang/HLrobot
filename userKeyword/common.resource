*** Settings ***
Library           ../library/compare_images.py
Resource          ../pageElements/homepage.resource
Variables         ../config/config.py

*** Keywords ***
ope_browser
    [Arguments]    ${URL}    ${browser_type}
    Open Browser    ${URL}    ${browser_type}
    Maximize Browser Window

AIOS_login
    [Arguments]    ${URL}    ${browser_type}    ${username}    ${verification_code}
    Open Browser    ${URL}    ${browser_type}
    Maximize Browser Window
    Set Selenium Implicit Wait    2s
    Sleep    2s
    Capture Page Screenshot    ${EXECDIR}/data/compareImages/screenImages/loginHome.png
    ${result}=    compare_images    ${EXECDIR}/data/compareImages/screenImages/loginHome.png    ${EXECDIR}/data/compareImages/originImages/loginHome.png
    Should Be True    ${result}
    Click Element    ${AIOS登录页-立即登录}
    Sleep    1s
    Click Element    ${解螺旋登录页-验证码登录-按钮}
    Sleep    500ms
    Input Text    ${解螺旋登录页-验证码登录-手机号输入框}    ${username}
    Click Element    ${解螺旋登录页-验证码登录-获取验证码}
    Sleep    500ms
    Input Text    ${解螺旋登录页-验证码登录-验证码输入框}    ${verification_code}
    Sleep    500ms
    Click Element    ${解螺旋登录页-密码登录-登录按钮}
    Sleep    3s
    ${local_token}=    Execute JavaScript  return JSON.parse(localStorage.getItem('token')).data
    Log    local_token:${local_token}
    ${var_token}=     Set Variable    ${local_token}
    Log    var_token:${var_token}
    Set Global Variable    ${ACCESS_TOKEN}    ${var_token}
    Log    global_token：${ACCESS_TOKEN}

AIOS_logout
    Mouse Over    ${AIOS首页-用户头像}
    Click Element    ${AIOS首页-退出登录}
    Sleep    3s
    Title Should Be    登录
