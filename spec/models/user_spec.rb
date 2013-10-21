require 'spec_helper'

describe User do
  it {should validate_presence_of :hased_password}
  it {should validate_presence_of :role}
  it {should validate_presence_of :username}
end
