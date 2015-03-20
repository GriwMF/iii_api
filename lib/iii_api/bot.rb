module IiiApi
  class Bot
    KEY = 'some very-very long string without any non-latin characters due to different string representations inside '\
          'of variable programming languages'

    attr_reader :chat_id

    def initialize(bot_id, chat_id = nil)
      @chat_id = if chat_id
                   encrypted_id = Faraday.get("http://iii.ru/api/2.0/json/Chat.init/#{bot_id}/#{chat_id}").body
                   JSON.parse(Base64.decode64(xor_crypt(Base64.decode64(encrypted_id), KEY)))['result']['cuid']
                 else
                   bot_id
                 end
    end

    def ask(message)
      request = '["' << @chat_id << '","' << message << '"]'
      encrypted_request = Base64.encode64(xor_crypt(Base64.encode64(request), KEY))

      encrypted_response = Faraday.post('http://iii.ru/api/2.0/json/Chat.request') do |req|
        req.body = encrypted_request
      end
      response = Base64.decode64(xor_crypt(Base64.decode64(encrypted_response.body), KEY))

      JSON.parse(response)['result']['text']['value']
    end

    private

    def xor_crypt(string, key)
      key = key.unpack('C*')
      string.each_byte.with_index.map { |byte, index| byte ^ key[index % key.size] }.pack('C*')
    end
  end
end