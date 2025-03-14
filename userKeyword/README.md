## httpclient 使用示例
*** Test Cases ***
Test Get Request
    [Documentation]    发送 GET 请求并验证响应
    Create Session With Bearer Token    mysession    ${BASE_URL}    ${ACCESS_TOKEN}
    ${response}=    Send Get Request    mysession    /posts/1
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}

Test Post Request
    [Documentation]    发送 POST 请求并验证响应
    Create Session With Bearer Token    mysession    ${BASE_URL}    ${ACCESS_TOKEN}
    ${data}=    Create Dictionary    title=foo    body=bar    userId=1
    ${response}=    Send Post Request    mysession    /posts    ${data}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    ${response.text}

Test Put Request
    [Documentation]    发送 PUT 请求并验证响应
    Create Session With Bearer Token    mysession    ${BASE_URL}    ${ACCESS_TOKEN}
    ${data}=    Create Dictionary    title=foo_updated    body=bar_updated    userId=1
    ${response}=    Send Put Request    mysession    /posts/1    ${data}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}

Test Delete Request
    [Documentation]    发送 DELETE 请求并验证响应
    Create Session With Bearer Token    mysession    ${BASE_URL}    ${ACCESS_TOKEN}
    ${response}=    Send Delete Request    mysession    /posts/1
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}
