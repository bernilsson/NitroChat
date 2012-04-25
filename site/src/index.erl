%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Welcome to NitroChat".

body() ->
    #container_12 { body=[
        #grid_8 { alpha=true, prefix=2, suffix=2, omega=true, body=inner_body() }
    ]}.

inner_body() -> 
    [
     #h1 { text = "NitroChat." },
     #h3 { text = "Welcome to my first project in Erlang and Nitrogen!" },
     #p{body=[
	      "NitroChat is my attempt at building a small webchat during a one-week-half-time school project for the course Application Development for the internet"
	      , "<br> This page was served by ", atom_to_list(node()), ", one of the distributed erlang nodes running this chat. It's pid is ", erlang:pid_to_list(self())]},
     #p{body=["To join a channel simple enter its name below and click join."]},
     #label{text="Channel"},
     #textbox{id=channelBox, postback=click},
     #button { id=button, text="Join", postback=click }
    ].

event(click) ->
    wf:redirect("/channel/" ++ wf:q(channelBox)).
