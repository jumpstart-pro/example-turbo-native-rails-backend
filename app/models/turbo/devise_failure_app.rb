module Turbo
  class DeviseFailureApp < Devise::FailureApp
    include Turbo::Native::Navigation

    def respond
      if request_format == :turbo_stream
        redirect
      else
        super
      end
    end

    def skip_format?
      %w[html turbo_stream */*].include? request_format.to_s
    end
  end
end
