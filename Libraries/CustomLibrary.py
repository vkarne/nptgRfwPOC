from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException
import xlrd
import calendar
import time
import re
import configparser
import os
import random
import string
import names
from appdirs import user_data_dir


class CustomLibrary:
    chrome_profile_path = "D:/Venkanna/chromeProfile"
    test_data = None

    def __init__(self):
        pass

    @property
    def _sel_lib(self):
        return BuiltIn().get_library_instance('Selenium2Library')

    @property
    def _driver(self):
        return self._sel_lib.driver

    def open_chrome_browser(self, url):
        """Return the True if Chrome browser opened """
        selenium = BuiltIn().get_library_instance('Selenium2Library')
        print(self.get_chrome_profile_path())
        try:
            options = webdriver.ChromeOptions()
            options.add_argument("disable-extensions")
            options.add_experimental_option("excludeSwitches", ["enable-automation", "load-extension"])
            options.add_argument("user-data-dir=" + self.get_chrome_profile_path())
            selenium.create_webdriver('Chrome', chrome_options=options)
            selenium.go_to(url)
        except Exception as e:
            raise e

    def javascript_click_by_xpath(self, xpath):
        element = self._driver.find_element(By.XPATH, xpath)
        self._driver.execute_script("arguments[0].click();", element)

    def javascript_click_by_id(self, id):
        element = self._driver.find_element(By.ID, id)
        self._driver.execute_script("arguments[0].click();", element)

    def javascript_click_by_css(self, css):
        element = self._driver.find_element(By.CSS_SELECTOR, css)
        self._driver.execute_script("arguments[0].click();", element)

    def check_exists_by_xpath(self, xpath):
        try:
            self._driver.find_element(By.XPATH, xpath)
        except NoSuchElementException:
            return False
        return True

    def check_exists_by_id(self, id):
        try:
            self._driver.find_element(By.ID, id)
        except NoSuchElementException:
            return False
        return True

    def check_exists_by_css(self, css):
        try:
            self._driver.find_element(By.CSS_SELECTOR, css)
        except NoSuchElementException:
            return False
        return True

    def get_element_attribute(self, locator, locator_type, attr):
        try:
            if locator_type == "xpath":
                return self._driver.find_element(By.XPATH, locator).get_attribute(attr)
            elif locator_type == "id":
                return self._driver.find_element(By.ID, locator).get_attribute(attr)
            elif locator_type == "css":
                return self._driver.find_element(By.CSS_SELECTOR, locator).get_attribute(attr)
            else:
                print("Invalid locator type passed to method, please check...!")
                return ""
        except NoSuchElementException:
            return ""

    def wait_until_time(self, arg):
        time.sleep(int(arg))
        return self

    def get_chrome_profile_path(self):
        # chrome_profile_path = user_data_dir('Chrome', 'Google') + '\\User Data'
        self.chrome_profile_path = "D:/Venkanna/chromeProfile"
        return self.chrome_profile_path

    def get_unique_test_data(self, test_data):
        """Returns the unique if data contains unique word """
        ts = calendar.timegm(time.gmtime())
        unique_string = str(ts)
        test_data = test_data.replace("UNIQUE", unique_string)
        test_data = test_data.replace("Unique", unique_string)
        test_data = test_data.replace("unique", unique_string)
        return self.test_data

    def get_random_number_test_data(self, test_data):
        num = ''.join(random.choices(string.digits, k=8))
        randomNumber = str(num)
        test_data = test_data.replace("RANDOM", randomNumber)
        test_data = test_data.replace("Random", randomNumber)
        test_data = test_data.replace("random", randomNumber)
        return self.test_data

    def get_random_name_test_data(self, test_data):
        randomText = names.get_full_name()
        test_data = test_data.replace("RANDOMNAME", randomText)
        test_data = test_data.replace("RandomName", randomText)
        test_data = test_data.replace("randomname", randomText)
        return self.test_data

    def wait_until_element_is_present(self, locator, locator_type):
        """ An Expectation for checking that an element is either invisible or not present on the DOM."""
        if locator_type == "xpath":
            WebDriverWait(self._driver, 60).until(EC.presence_of_element_located((By.XPATH, locator)))
        elif locator_type == "id":
            WebDriverWait(self._driver, 60).until(EC.presence_of_element_located((By.ID, locator)))
        else:
            WebDriverWait(self._driver, 60).until(EC.presence_of_element_located((By.CSS_SELECTOR, locator)))

    def wait_until_element_clickable(self, locator, locator_type):
        """ An Expectation for checking that an element is either invisible or not present on the DOM."""
        if locator_type == "xpath":
            print("clickable before")
            WebDriverWait(self._driver, 60).until(EC.element_to_be_clickable((By.XPATH, locator)))
            print("clickable after")
        elif locator_type == "id":
            print("clickable before")
            WebDriverWait(self._driver, 60).until(EC.element_to_be_clickable((By.ID, locator)))
            print("clickable after")
        else:
            print("clickable before")
            WebDriverWait(self._driver, 60).until(EC.element_to_be_clickable((By.CSS_SELECTOR, locator)))
            print("clickable after")

    def press_page_up(self):
        try:
            actions = ActionChains(self._driver)
            actions.key_up(Keys.PAGE_UP).perform()
            print("Scrolled to Page Up with selected locator")

        except Exception as err:
            print(str(err) + "Scrolled to Page Up with locator failed")

    def press_page_down(self):
        try:
            actions = ActionChains(self._driver)
            actions.key_down(Keys.PAGE_DOWN).perform()
            print("Scrolled to Page down with selected locator")

        except Exception as err:
            print(str(err) + "Scrolled to Page down with locator failed")

    def press_up_arrow(self):
        try:
            actions = ActionChains(self._driver)
            actions.key_up(Keys.ARROW_UP).perform()
        except Exception as e:
            print(str(e) + "Key press not happened")

    def press_down_arrow(self):
        try:
            actions = ActionChains(self._driver)
            actions.key_down(Keys.ARROW_DOWN).perform()
        except Exception as e:
            print(str(e) + "Key press not happened")






