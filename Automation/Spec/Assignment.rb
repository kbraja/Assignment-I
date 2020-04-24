require 'selenium-webdriver'
require_relative 'Assignment_home.rb'
describe 'Assignment' do
    
    #Browser initialization
    before(:all) do
        options = Selenium::WebDriver::Chrome::Options.new(options: {"excludeSwitches" => ["enable-automation"]})
        @driver = Selenium::WebDriver.for :chrome, options: options
        @base_url = 'https://www.starofservice.in/dir/telangana/hyderabad/hyderabad/plumbing#/'
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20,interval: 5)
        @assignment_home = Pages::AssignmentHome.new(@driver)
        @driver.get(@base_url)
    end

    it 'test case' do
        location_to_be_selected = 'Chennai'
        @assignment_home.chooseLocation(location_to_be_selected)
        
        part = ['Tap']
        @assignment_home.chooseThings(part)

        action = ['Replace']
        @assignment_home.chooseAction(action)

        reason = ['Leak in a pipe']
        @assignment_home.chooseReason(reason)

        sampleText = 'Replacement needed in urgent'
        @assignment_home.comment(sampleText)
        
        dateOption = 'On a specific date'
        @assignment_home.chooseDateOption(dateOption)
        
        noOfDayFromCurrentday = 2
        @assignment_home.chooseData(noOfDayFromCurrentday)
 
        slot = '03:00'
        duration = 4
        @assignment_home.chooseSlot(slot,duration)

        @wait.until{(@assignment_home.getEmail()).displayed?}
    end

    #Quit Browser
    after :all do
        @driver.quit
    end
end
