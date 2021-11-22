*** Settings ***
Library         Selenium2Library
Library         String
Library         pabot.PabotLib
Library         OperatingSystem
Library         Collections
Library         Screenshot
Library         ../Libraries/CustomLibrary.py
Resource        global_variables.robot
Resource        ../PageObjects/sms_888_po.robot
Resource        ../Keywords/common.robot
Resource        ../Keywords/sms-888.robot