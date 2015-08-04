require 'headless'

# Common API/wrapper for working with headless browsers
class BrowserDriver
  # Currently a wrapper around Mechanize
  attr_reader :browser
  attr_reader :headless
  attr_reader :current_page

  def initialize(params)
    @headless = Headless.new
    @headless.start
    @browser = params[:browser].new(params[:options])
  end

  def visit(url)
    self.browser.goto(url)
    self.browser.wait
    return self
  end

  def fill_and_submit_form(form_finder, params)
    params.keys.each do |key|
      self.browser.text_field(name: key.to_s).set(params[key])
    end
    self.browser.input(name: 'Submit').click
    self.browser.wait
    return self
  end

  def elements(finder)
    self.browser.elements(finder)
  end

  # Roll #radios into #elements somehow maybe
  def radios
    self.browser.radios
  end

  def select_radio(finder)
    self.browser.radio(id: finder[:id]).set
    self.browser.wait
    return self
  end

  def click_link(finder)
    self.browser.link(id: finder[:id]).click
    self.browser.wait
    return self
  end

  def html
    self.browser.html
  end

  def finish
    self.browser.close
    headless.destroy
  end
end