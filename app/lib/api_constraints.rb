class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end
  def matches?(req)
    @default || default.headers['Accept'].include?("application/vnd.example.com.v#{version}")
  end
end