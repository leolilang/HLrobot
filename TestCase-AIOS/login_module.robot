*** Settings ***
Library           Selenium2Library
Library           ../library/compare_images.py
Library           ../library/MyLibrary.py
Variables         ../config/config.py
Resource          ../pageElements/login_element.resource
Resource          ../userKeyword/common.resource

*** Test Cases ***
login_vip
    AIOS_login    ${URL}    ${browser_type}    ${username}    ${verification_code}
    Title Should Be    首页-AIOS
    AIOS_logout
    Close Browser

login_non_vip
    AIOS_login    ${URL}    ${browser_type}    ${username_non_vip}    ${verification_code}
    Log    ${ACCESS_TOKEN}
    Capture Page Screenshot    ${EXECDIR}/data/compareImages/screenImages/non_vip_login_page.png
    ${result}=    compare_images    ${EXECDIR}/data/compareImages/screenImages/non_vip_login_page.png    ${EXECDIR}/data/compareImages/originImages/non_vip_login_page.png
    Should Be True    ${result}
    Close Browser
