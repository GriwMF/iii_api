describe IiiApi::Bot do
  let(:bot_id) { '6de4ced8-434b-4803-8b46-32a64b92eb8a' }
  let(:chat_id) { 'some-valid-uri' }
  let(:bot) { using_vcr('iii/init') { IiiApi::Bot.new(bot_id, chat_id) } }

  def using_vcr(name)
    VCR.use_cassette(name) { yield }
  end

  describe '#initialize' do
    it 'initialize new chat saves an unique decrypted chat id as @chat_id if two parameters were passed' do
      expect(bot.instance_variable_get(:@chat_id)).to eq 'e0f7df52-3521-49dc-ba80-f750854c2ed8'
    end

    it 'saves passed bot id as @chat_id if no chat_id provided and no need of initialization' do
      bot = IiiApi::Bot.new('e0f7df52-3521-49dc-ba80-000000000000')
      expect(bot.instance_variable_get(:@chat_id)).to eq 'e0f7df52-3521-49dc-ba80-000000000000'
    end
  end

  describe '#ask' do
    it 'returns answer to provided message' do
      answer = using_vcr('iii/answers') { bot.ask('Как дела?') }
      expect(answer).to eq('Пасиб. Нормально. Ты-то как?')
    end
  end
end
