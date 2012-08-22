# -*- coding: utf-8 -*-
# くそわろ

Plugin.create(:KusoWaro) do
  filter_command do |menu|
    menu[:KusoWaro] = {
      :slug => :KusoWaro,
      :name => 'くそわろ',
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m|
        if UserConfig[:reply_or_retweet] == "reply"
          str = "@#{m.message.user.idname} くそわろ"
        else
          str = "そのツイット( '-^ )b クソワロタです RT @#{m.message.user.idname}: #{m.message} "
        end
        Post.primary_service.update(:message=> str,
                                    :replyto => m.message)
      },
      :visible => true,
      :role => :message }
    [menu]
  end

  settings("くそわろ") do
    select('種類', :reply_or_retweet) do
      option "reply", "くそわろ"
      option "retweet", "そのツイット"
    end
  end
end
