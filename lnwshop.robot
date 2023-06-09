*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${website}                  https://www.lnwshop.com/
${browser}                  gc
${locator_register_css}     css=#lbMember > a.lbregister > span.txt
${locator_name}             name=firstname
${locator_surname}          name=lastname
${locator_namedisplay}      name=display_name
${locator_email}            name=email
${locator_pass}             name=password
${locator_repass}           name=re_password
${locator_register_button}  id=nextbutton
${locator_checkbox_css}     css=#register_form > section:nth-child(2) > div:nth-child(5) > div > div:nth-child(4)
${locator_date}             id=birthday_day
${locator_month}            id=birthday_month
${locator_year}             id=birthday_year
${locator_phone}            name=telephone
${locator_save_register}    css=#register_form > section:nth-child(2) > input
${locator_message_css}      css=#regis_success > div > h1


*** Keywords ***
Open Website lnwshop
    Set Selenium speed      0.5s
    Open Browser        ${website}      ${browser}          options=add_experimental_option("detach", True)
    Maximize Browser Window

Go to button register
    Set Focus To Element        ${locator_register_css}
    Click Element               ${locator_register_css}

Input Data on Register Page and save
    wait until element is visible      ${locator_name}                 5s
    wait until page contains           สมัครสมาชิก                       5s
    Input Text                         ${locator_name}             test001
    Input Text                         ${locator_surname}          last001
    Input Text                         ${locator_namedisplay}      test002
    ${random_email}                    Generate Random String      3   LOWER
    ${random_number}                   Generate Random String      3   0123456789
    Input Text                         ${locator_email}            ${random_email}${random_number}@gmail.com
    Input Text                         ${locator_pass}             1234ABVD
    Input Text                         ${locator_repass}           1234ABVD
    Click Element                      ${locator_register_button}
    wait until element is visible      ${locator_checkbox_css}         5s
    Click Element                      ${locator_checkbox_css}
    Select From List By Index          ${locator_date}                 6
    Select From List By Index          ${locator_month}                2
    Select From List By Index          ${locator_year}                 34
    Input Text                         ${locator_phone}                089-999-9999
    Click element                      ${locator_save_register}

Verify error message correctly
        Wait Until Element Is Visible      ${locator_message_css}    10s
        ${txt}=     Get text               ${locator_message_css}
        Should Be Equal                    ${txt}         ขั้นตอนสุดท้ายสำหรับการสมัครสมาชิก
        Close Browser


*** Test Cases ***

Register lnwshop
    Open Website lnwshop
    Go to button register
    Input Data on Register Page and save
    Verify error message correctly









