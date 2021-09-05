# frozen_string_literal: true

class SecureController < ApplicationController
  before_action :authenticate_user!
end
