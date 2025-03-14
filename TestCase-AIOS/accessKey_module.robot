*** Settings ***
Suite Setup       AIOS_login    ${URL}    ${browser_type}    ${username}    ${verification_code}
Suite Teardown    AIOS_logout
Library           Selenium2Library
Library           RequestsLibrary
Library           ../library/MyLibrary.py
Variables         ../config/config.py
Resource          ../userKeyword/common.resource
Resource          ../userKeyword/httpclient.resource
Resource          ../pageElements/login_element.resource
Resource          ../pageElements/homepage.resource
Resource          ../pageElements/accessKey.resource

*** Test Cases ***
清理密钥
    Click Element    ${AIOS首页-logo}
    Sleep    1s
    Mouse Over    ${AIOS首页-用户头像}
    Sleep    500ms
    Click Element    ${AIOS首页-密钥设置}
    ${element_exists}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${密钥设置-创建AccessKey-置灰} 2
    Sleep    2s
    IF    ${element_exists}
        Log    The 创建AccessKey-置灰 element exists, performing action on it.
        Sleep    2s
        ${label_text}=    Get Text    ${密钥设置-列表-已禁用}
        IF    '${label_text}' == '已启用'
            Click Element    ${密钥设置-列表-操作}
            Sleep    500ms
            Click Element    ${密钥设置-列表-禁用}
            Wait Until Element Is Visible    ${密钥设置-列表-禁用成功}    timeout=500ms
                Sleep    2s
        ELSE
            Log    The accessKey is disable.
        END
        Click Element    ${密钥设置-列表-操作}
        Sleep    500ms
        Click Element    ${密钥设置-列表-删除}
        Sleep    500ms
        Click Element    ${密钥设置-选择手机号}
        Sleep    500ms
        Click Element    ${密钥设置-获取验证码}
        Sleep    500ms
        Input Text    ${密钥设置-输入验证码}    ${verification_code}
        Sleep    500ms
        Click Element    ${密钥设置-验证-下一步}
        Sleep    3ms
        ${delete_list}=    Get WebElements    ${密钥设置-列表-删除-确认}
        log    ${delete_list}
        Click Element    ${delete_list[1]}
        Wait Until Element Is Visible    ${密钥设置-列表-删除成功}    timeout=500ms
        Sleep    2s
    ELSE
        Log    The element does not exist, performing alternative action.
        Log    Maybe display a message to the user that the element is missing.
    END

清理绑定密钥的文件夹
    [Documentation]    发送 GET 请求查询创建的文件
    Create Session With Bearer Token    my_session    ${BASE_URL}    ${ACCESS_TOKEN}
    ${response}=    Send Get Request    my_session    ${search}?name=UI--
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}
    ${folder_ids}=    Parse Json And Extract values    ${response.text}    $.data.data[*].id
    ${json_data}=    Create Dictionary    ids=${folder_ids}
    ${response}=    Send Delete Request With Json    my_session    folders/delete    ${json_data}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}
    ${response}=    Send Get Request    my_session    ${search}?name=UI--
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}

创建文件夹-用于绑定密钥
    Click Element    ${AIOS首页-logo}
    Sleep    1s
    Mouse Over    ${AIOS首页-新建文件}
    Click Element    ${AIOS首页-新建文件-新建文件夹}
    Sleep    500ms
    Input Text    ${AIOS首页-新建文件-新建文件夹-名称}    UI--绑定密钥文件夹
    Input Text    ${AIOS首页-新建文件-新建文件夹-描述}    UI--绑定密钥文件夹--描述字段
    Click Element    ${AIOS首页-新建文件-新建文件夹-确认}
    Wait Until Element Is Visible    XPATH=//p[text()='新建文件夹成功']    timeout=500ms
    Sleep    1s

创建密钥
    Click Element    ${AIOS首页-logo}
    Sleep    1s
    Mouse Over    ${AIOS首页-用户头像}
    Sleep    500ms
    Click Element    ${AIOS首页-密钥设置}
    Sleep    500ms
    Click Element    ${密钥设置-创建AccessKey}
    Sleep    500ms
    Click Element    ${密钥设置-选择手机号}
    Sleep    500ms
    Click Element    ${密钥设置-获取验证码}
    Sleep    500ms
    Input Text    ${密钥设置-输入验证码}    ${verification_code}
    Sleep    500ms
    Click Element    ${密钥设置-验证-下一步}
    Sleep    500ms
    Click Element    ${密钥设置-选择文件夹-选择}
    Sleep    500ms
    Click Element    ${密钥设置-选择文件夹-下一步}
    Sleep    500ms
    Click Element    ${密钥设置-完成-复制}
    Wait Until Element Is Visible    ${密钥设置-完成-文本已复制}    timeout=500ms
    Click Element    ${密钥设置-完成-完成}
    Wait Until Element Is Visible    ${密钥设置-完成-密钥创建成功}    timeout=500ms
    Sleep    2s

编辑密钥
    Click Element    ${密钥设置-列表-操作}
    Sleep    500ms
    Click Element    ${密钥设置-列表-编辑}
    Sleep    500ms
    Click Element    ${密钥设置-选择手机号}
    Sleep    500ms
    Click Element    ${密钥设置-获取验证码}
    Sleep    500ms
    Input Text    ${密钥设置-输入验证码}    ${verification_code}
    Sleep    500ms
    Click Element    ${密钥设置-列表-编辑-下一步}
    Sleep    500ms
    Click Element    ${密钥设置-选择文件夹-选择}
    Sleep    500ms
    ${accept_list}=    Get WebElements    ${密钥设置-列表-编辑-确认}
    log    ${accept_list}
    Click Element    ${accept_list[1]}
    Wait Until Element Is Visible    ${密钥设置-列表-编辑成功}    timeout=500ms
    Sleep    2s

禁用密钥001
    Click Element    ${密钥设置-列表-操作}
    Sleep    500ms
    Click Element    ${密钥设置-列表-禁用}
    Wait Until Element Is Visible    ${密钥设置-列表-禁用成功}    timeout=500ms
    Sleep    2s

启用密钥
    Click Element    ${密钥设置-列表-操作}
    Sleep    500ms
    Click Element    ${密钥设置-列表-启用}
    Wait Until Element Is Visible    ${密钥设置-列表-启用成功}    timeout=500ms
    Sleep    2s

禁用密钥002
    Click Element    ${密钥设置-列表-操作}
    Sleep    500ms
    Click Element    ${密钥设置-列表-禁用}
    Wait Until Element Is Visible    ${密钥设置-列表-禁用成功}    timeout=500ms
    Sleep    2s

删除密钥
    Reload Page
    Sleep    2s
    Click Element    ${密钥设置-列表-操作}
    Sleep    500ms
    Click Element    ${密钥设置-列表-删除}
    Sleep    500ms
    Click Element    ${密钥设置-选择手机号}
    Sleep    500ms
    Click Element    ${密钥设置-获取验证码}
    Sleep    500ms
    Input Text    ${密钥设置-输入验证码}    ${verification_code}
    Sleep    500ms
    Click Element    ${密钥设置-验证-下一步}
    Sleep    500ms
    ${delete_list}=    Get WebElements    ${密钥设置-列表-删除-确认}
    log    ${delete_list}
    Click Element    ${delete_list[1]}
    Wait Until Element Is Visible    ${密钥设置-列表-删除成功}    timeout=500ms
    Sleep    2s
