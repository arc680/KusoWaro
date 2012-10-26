# -*- coding: utf-8 -*-
# くそわろ

Plugin.create(:KusoWaro) do
  command(:KusoWaro,
          name: 'くそわろ',
          condition: Plugin::Command[:CanReplyAll],
          visible: true,
          role: :timeline) do |m|
    m.messages.map do |msg|
      str = "@#{msg.message.user.idname} くそわろ"
      Post.primary_service.update(:message => str,
                                  :replyto => msg.message)
    end
  end

  settings("くそわろ") do
    select('種類', :reply_or_retweet) do
      option "reply", "くそわろ"
      option "retweet", "そのツイット"
    end
  end
end
