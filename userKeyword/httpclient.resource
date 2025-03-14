*** Settings ***
Library           ../library/compare_images.py
Library           RequestsLibrary
Library           JSONLibrary
Variables         ../config/config.py

*** Keywords ***
Create Session With Bearer Token
    [Arguments]    ${session_name}    ${base_url}    ${access_token}
    [Documentation]    创建一个带 Bearer Token 认证的 HTTP 会话
    ${headers}=    Create Dictionary    Authorization=Bearer ${access_token}    platform=pc    source=PC
    Create Session    ${session_name}    ${base_url}    headers=${headers}    verify=False

Send Get Request
    [Arguments]    ${session_name}    ${endpoint}
    [Documentation]    发送带 Bearer Token 认证的 GET 请求
    ${response}=    GET On Session    ${session_name}    ${endpoint}
    RETURN    ${response}

Send Post Request
    [Arguments]    ${session_name}    ${endpoint}    ${data}
    [Documentation]    发送带 Bearer Token 认证的 POST 请求
    ${response}=    Post Request    ${session_name}    ${endpoint}    json=${data}
    RETURN    ${response}

Send Put Request
    [Arguments]    ${session_name}    ${endpoint}    ${data}
    [Documentation]    发送带 Bearer Token 认证的 PUT 请求
    ${response}=    Put Request    ${session_name}    ${endpoint}    json=${data}
    RETURN    ${response}

Send Delete Request
    [Arguments]    ${session_name}    ${endpoint}
    [Documentation]    发送带 Bearer Token 认证的 DELETE 请求
    ${response}=    DELETE On Session    ${session_name}    ${endpoint}
    RETURN    ${response}

Send Delete Request With Json
    [Arguments]    ${session_name}    ${endpoint}    ${json_data}
    [Documentation]    发送带 Bearer Token 认证的 DELETE 请求
    ${response}=    DELETE On Session    ${session_name}    ${endpoint}    json=${json_data}
    RETURN    ${response}

Parse Json And Extract values
    [Arguments]    ${response_text}    ${jsonpath}
    [Documentation]    解析 JSON 响应并提取 jsonpath=$.data.data[*].id
    ${json_data}=    To JSON    ${response_text}
    ${values}=    Get Value From Json    ${json_data}    ${jsonpath}
    RETURN    ${values}
