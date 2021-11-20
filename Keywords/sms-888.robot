*** Settings ***
Documentation    Keywords definition of sms-888
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
    page should contain element   ${account_name_css}
    page should contain element   ${account_type_css}
    page should contain element   ${parent_account_css}
    page should contain element   ${managing_distributor_css}
    page should contain element   ${international_customer_css}
    page should contain element   ${ownership_css}
    web Page Down
    page should contain element   ${site_id_css}
    page should contain element   ${pin_css}
    page should contain element   ${priority_css}
    page should contain element   ${price_list_css}
    page should contain element   ${comments_css}
    web Page Down
    page should contain element   ${automation_source_css}
    page should contain element   ${website_css}
    page should contain element   ${email_css}
    page should contain element   ${main_telephone_css}
    page should contain element   ${fax_css}

Verify Address Information
    web Page Down
    page should contain element   ${address_street1_css}
    page should contain element   ${address_street2_css}
    page should contain element   ${address_city_css}
    page should contain element   ${address_state_province_css}
    page should contain element   ${address_zip_code_css}
    page should contain element   ${address_country_css}
    page should contain element   ${address_county_css}

Verify Billing Information
    page should contain element   ${bill_to_account_css}
    page should contain element   ${bill_to_erp_css}

Verify Contact Information
    page should contain element   ${primary_contact_css}
    page should contain element   ${maintenance_contract_contact_css}
    page should contain element   ${rma_po_contact_css}
    page should contain element   ${ami_service_contact_css}

Verify Territory Information
    page should contain element   ${owner_css}
    page should contain element   ${region_css}
    page should contain element   ${district_css}
    page should contain element   ${territory_css}
    page should contain element   ${customer_success_specialist_css}

Goto Home page
    click element   ${home_link_css}
    wait until element is visible   ${dashboards_selector_id}


