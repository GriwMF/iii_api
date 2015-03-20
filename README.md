# IiiApi

Simple ruby gem for using iii.ru (russian speaking bot)

## Installation

Add this line to your application's Gemfile:

    gem 'iii_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iii_api

## Usage

Create and customise new bot at iii.ru, save it's unique id from url (e.g. `6de4ced8-434b-4803-8b46-32a64b92eb8a`)

Initialize new chat room with your bot id and some unique id:

    bot = IiiApi::Bot.new('6de4ced8-434b-4803-8b46-32a64b92eb8a', 'some-valid-uri-as-chat-id')

You can now access your iii.ru chat id as `bot.chat_id`

If you want to reuse it later, you can save it and initialize bot with it:

    save_id_somewhere = bot1.chat_id
    ...
    bot2 = IiiApi::Bot.new(save_id_somewhere)

Finally, just call the `ask` method with your message and receive answer:

    bot.ask('Как дела?') # 'Пасиб. Нормально. Ты-то как?'

You may want to sanitize returned value, as sometimes it contains tags. Just use some third party libraries for this.
For example: `ActionView::Base.full_sanitizer.sanitize(returned_string)`

## Contributing

1. Fork it ( https://github.com/GriwMF/iii_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
