require 'selenium-webdriver'
require_relative 'Assignment_home.rb'
describe 'Assignment' do
    
    #Browser initialization
    before(:all) do
        @driver = Selenium::WebDriver.for :chrome
        # @driver = Driver.new
        @base_url = 'https://www.starofservice.in/dir/telangana/hyderabad/hyderabad/plumbing#/'
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20,interval: 5)
        @assignment_home = Pages::AssignmentHome.new(@driver)
        @driver.get(@base_url)
    end

    it 'test case' do
        location_to_be_selected = 'Chennai'
        @assignment_home.chooseLocation(location_to_be_selected)
        
        part1 = ['Tap']
        @assignment_home.chooseThings(part1)

        action1 = ['Replace']
        @assignment_home.chooseAction(action1)

        reason1 = ['Leak in a pipe']
        @assignment_home.chooseReason(reason1)

        sampleText = 'Replacement needed in urgent'
        @assignment_home.comment(sampleText)
        
        dateOption = 'On a specific date'
        @assignment_home.chooseDateOption(dateOption)
        
        date = Date.today + 2
        targetDate = date.strftime('%d')
        targetMonth = date.strftime('%B')
        targetYear = date.strftime('%Y')
        @assignment_home.chooseData(targetDate,targetMonth,targetYear)

        slot = '03:00'
        duration = '4'
        @assignment_home.chooseSlot(slot,duration)

        @wait.until{(@assignment_home.getEmail()).displayed?}
    end

    #Quit Browser
    after :all do
        @driver.quit
    end
end
