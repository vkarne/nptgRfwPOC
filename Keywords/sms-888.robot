*** Settings ***
Documentation    Keywords definition of sms-888
Resource          ../Global/global_variables.robot
Resource          ../Global/super.robot

*** Keywords ***
click Accounts Link
    click element   ${account_link_id}
    wait until element is visible   ${show_chart_btn_id}

Open Active Account
    click element   ${my_active_accounts_xpath}
    wait until element is visible   ${active_accounts_xpath}    ${LONG_WAIT}
    click element   ${active_accounts_xpath}
    wait until element is visible   ${first_account_rec_xpath}  ${LONG_WAIT}

Open Account Details
    click element   ${first_account_rec_xpath}
    wait until element is visible   ${account_name_css}  ${LONG_WAIT}

Verify Account Information
    Page Should Contain Element   ${account_name_css}
    Page Should Contain Element   ${account_type_css}
    Page Should Contain Element   ${parent_account_css}
    Page Should Contain Element   ${managing_distributor_css}
    Page Should Contain Element   ${international_customer_css}
    Page Should Contain Element   ${ownership_css}
    Page Should Contain Element   ${site_id_css}
    Page Should Contain Element   ${pin_css}
    Page Should Contain Element   ${priority_css}
    scroll element into view    ${physical_address_css}
    Page Should Contain Element   ${price_list_css}
    Page Should Contain Element   ${comments_css}
    Page Should Contain Element   ${automation_source_css}
    Page Should Contain Element   ${website_css}
    Page Should Contain Element   ${email_css}
    Page Should Contain Element   ${main_telephone_css}
    Page Should Contain Element   ${fax_css}

Verify Address Information
    scroll element into view    ${address_zip_code_css}
    Page Should Contain Element   ${address_street1_css}
    Page Should Contain Element   ${address_street2_css}
    Page Should Contain Element   ${address_city_css}
    Page Should Contain Element   ${address_state_province_css}
    Page Should Contain Element   ${address_zip_code_css}
    Page Should Contain Element   ${address_country_css}
    Page Should Contain Element   ${address_county_css}

Verify Billing Information
    Page Should Contain Element   ${bill_to_account_css}
    Page Should Contain Element   ${bill_to_erp_css}

Verify Contact Information
    Page Should Contain Element   ${primary_contact_css}
    Page Should Contain Element   ${maintenance_contract_contact_css}
    Page Should Contain Element   ${rma_po_contact_css}
    Page Should Contain Element   ${ami_service_contact_css}

Verify Territory Information
    Page Should Contain Element   ${owner_css}
    Page Should Contain Element   ${region_css}
    Page Should Contain Element   ${district_css}
    Page Should Contain Element   ${territory_css}
    Page Should Contain Element   ${customer_success_specialist_css}

Goto Home page
    click element   ${home_link_css}
    wait until element is visible   ${dashboards_selector_id}


