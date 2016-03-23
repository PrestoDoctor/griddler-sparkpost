require 'spec_helper'
require 'active_support/all'

describe Griddler::Sparkpost::Adapter do
  it 'registers itself with griddler' do
    Griddler.adapter_registry[:sparkpost].should eq Griddler::Sparkpost::Adapter
  end
end

describe Griddler::Sparkpost::Adapter, '.normalize_params' do
  # it_should_behave_like 'Griddler adapter',
  #   :sparkpost,
  #   {
  #     text: 'hi',
  #     to: 'Hello World <hi@example.com>',
  #     cc: 'emily@example.com',
  #     from: 'There <there@example.com>',
  #   }

  # it 'changes attachments to an array of files' do
  #   params = default_params.merge(
  #     attachments: '2',
  #     attachment1: upload_1,
  #     attachment2: upload_2,
  #    'attachment-info' => <<-eojson
  #       {
  #         'attachment2': {
  #           'filename': 'photo2.jpg',
  #           'name': 'photo2.jpg',
  #           'type': 'image/jpeg'
  #         },
  #         'attachment1': {
  #           'filename': 'photo1.jpg',
  #           'name': 'photo1.jpg',
  #           'type': 'image/jpeg'
  #         }
  #       }
  #     eojson
  #   )

  #   normalized_params = Griddler::Sparkpost::Adapter.normalize_params(params)
  #   normalized_params[:attachments].should eq [upload_1, upload_2]
  #   normalized_params.should_not have_key(:attachment1)
  #   normalized_params.should_not have_key(:attachment2)
  #   normalized_params.should_not have_key(:attachment_info)
  # end

  it 'has no attachments' do
    params = default_params.merge(attachments: '0')

    normalized_params = Griddler::Sparkpost::Adapter.normalize_params(params)
    normalized_params[:attachments].should be_empty
  end

  it 'wraps to in an array' do
    normalized_params = Griddler::Sparkpost::Adapter.normalize_params(default_params)

    normalized_params[:to].should eq default_params['_json'][0]['msys']['relay_message']['content']['to']
  end

  it 'wraps cc in an array' do
    normalized_params = Griddler::Sparkpost::Adapter.normalize_params(default_params)

    normalized_params[:cc].should eq default_params['_json'][0]['msys']['relay_message']['content']['cc']
  end

  it 'returns an array even if cc is empty' do
    params = default_params
    params['_json'][0]['msys']['relay_message']['content']['cc'] = nil
    normalized_params = Griddler::Sparkpost::Adapter.normalize_params(params)

    normalized_params[:cc].should eq []
  end

  def default_params
    {
      "_json": [{
          "msys": {
              "relay_message": {
                  "rcpt_to": "hi@example.com",
                  "friendly_from": "there@example.com",
                  "customer_id": "12345",
                  "content": {
                      "text": "What up what up",
                      "subject": "sup wit it",
                      "html": "<div>hello</div>",
                      "headers": [{
                          "Return-Path": "<there@example.com>"
                      }, {
                          "From": "Test User <there@example.com>"
                      }, {
                          "To": "hi@example.com"
                      }],
                      "email_rfc822": "XXX",
                      "email_rfc822_is_base64": false,
                      "to": ["hi@example.com"],
                      "cc": ["cc@example.com"]
                  },
                  "msg_from": "there@example.com",
                  "webhook_id": "123456789"
              }
          }
      }]
    }.with_indifferent_access
  end
end