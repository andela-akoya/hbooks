# This class checks the version of api a request was made to
# by checking the value of the :accept key in the headers hash
# of the request object
class ApiVersion
  attr_reader :version, :default
  def initialize(version, default = false)
    @version = version
    @default = default
  end

  # check whether version is specified or is default
  def matches?(request)
    check_headers request.headers || default
  end

  private

  def check_headers(headers)
    # check version from Accept headers; except custom media type `books
    accept = headers[:accept]
    p accept
    accept && accept.include?("application/vnd.hbooks.#{version}+json")
  end
end
