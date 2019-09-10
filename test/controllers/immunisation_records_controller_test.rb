# frozen_string_literal: true

require 'test_helper'

class ImmunisationRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @immunisation_record = immunisation_records(:one)
  end

  test 'should get immunisation_record' do
    get immunisation_records_url(feijoa_id: @immunisation_record.feijoa_id, date_of_birth: @immunisation_record.date_of_birth)
    assert_response 200
  end
end
