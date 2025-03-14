*** Settings ***
Library           Selenium2Library

*** Variables ***
${最近打开-清空}    XPATH=//span[@style='cursor: pointer;']
${最近打开-文档}    XPATH=//span[@class='name f-toe el-tooltip__trigger el-tooltip__trigger' and text()='UI创建文档']
${最近打开-文档-删除}    XPATH=//span[@class='name f-toe el-tooltip__trigger el-tooltip__trigger' and text()='UI创建文档']/following-sibling::div
${最近打开-文档-暂无数据}    XPATH=//p[@class='no-data-font' and text()='暂无最近打开内容']





