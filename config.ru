# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

Time::DATE_FORMATS[:twelve_hour] = "%Y年%m月%d日 %H時%M分"

run Rails.application
