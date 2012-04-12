%% -*- mode: nitrogen -*-
-module (login).
-compile(export_all).
-include_lib("nitrogen/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Channel: " ++ wf:path_info() ++ " Please log in!".

body() -> 
    wf:wire(login_submit, username, #validate { validators=[
        #is_required { text="Required." }
    ]}),
    wf:wire(login_submit, password, #validate { validators=[
        #is_required { text="Required." },
        #custom { 
            text="Invalid password.", 
            function=fun(_, Value) -> Value == "p" end
        }
    ]}),
 
    [
    #panel { id=login_wrap, style="margin: 50px;", body=[
	    #h1 { text="Channel: " ++ wf:path_info()},
	    #panel{ id=login_page,
	   
		body=[
		    
		    #p {body="Please log in to this channel."},
		    #flash {},
		    #label { text="Username" },
		    #textbox { id=username, next=password, text=wf:session_default(username,"Please log in") },
		    #br {},
		    #label { text="Password" },
		    #password { id=password, next=login_submit },
		    #br {},
		    #button { text="Login", id=login_submit, postback=login }
    ]}]}].

scripts() ->
    "".

event(login) ->
    wf:role(wf:path_info(), true),
    wf:session(username,wf:q(username)),
    wf:user(wf:q(username)),
    wf:redirect_from_login("/channel/"++wf:path_info());
   
event(logout) ->
    wf:logout(),
    wf:redirect_to_login("/login").
