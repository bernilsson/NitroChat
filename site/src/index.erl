%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Welcome to Chatty".

body() ->
    #container_12 { body=[
        #grid_8 { alpha=true, prefix=2, suffix=2, omega=true, body=inner_body() }
    ]}.

inner_body() -> 
    [
     #h1 { text="Welcome to my web server." },
     #p{body=[
	      "Please test the chat system I've built!"
	      , "<br>", atom_to_list(node()), " ", erlang:pid_to_list(self())]},
     #p{body=["Enter any channel name below:"]},
     #label{text="Channel"},
     #textbox{id=channelBox, postback=click},
     #button { id=button, text="Click me!", postback=click }
     
    ].

event(click) ->
    wf:redirect("/channel/" ++ wf:q(channelBox)).
