%% -*- mode: nitrogen -*-
-module (action_flash_title).
-compile (export_all).
-include_lib ("nitrogen/include/wf.hrl").
-include("records.hrl").

%% Move the following line to records.hrl:


render_action(Record = #flash_title{}) ->
    wf:f("newExcitingAlerts(\"~s says ~s\");",[[wf:js_escape(Record#flash_title.user)], [wf:js_escape(Record#flash_title.text)]]).
