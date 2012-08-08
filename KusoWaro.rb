# -*- coding: utf-8 -*-
# くそわろ

Module.new do
  Plugin.create(:KusoWaro).add_event_filter(:command){ |menu|
    menu[:KusoWaro] = {
      :slug => :KusoWaro,
      :name => 'くそわろ',
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m|
        Post.primary_service.update(:message=> "@#{m.message.user.idname} くそわろ",
                                    :replyto => m.message)
         },
      :visible => true,
      :role => :message }
    [menu]
  }
end
