# frozen_string_literal: true

require 'test_helper'

class ImmunisationRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @immunisation_record = immunisation_records(:one)
  end

  test 'should get index' do
    get immunisation_records_url, as: :json
    assert_response :success
  end

  test 'should create immunisation_record' do
    assert_difference('ImmunisationRecord.count') do
      post immunisation_records_url, params: { immunisation_record: { data: @immunisation_record.data, feijoa_id: @immunisation_record.feijoa_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show immunisation_record' do
    get immunisation_record_url(@immunisation_record), as: :json
    assert_response :success
  end

  test 'should update immunisation_record' do
    patch immunisation_record_url(@immunisation_record), params: { immunisation_record: { data: @immunisation_record.data, feijoa_id: @immunisation_record.feijoa_id } }, as: :json
    assert_response 200
  end

  test 'should destroy immunisation_record' do
    assert_difference('ImmunisationRecord.count', -1) do
      delete immunisation_record_url(@immunisation_record), as: :json
    end

    assert_response 204
  end
end
