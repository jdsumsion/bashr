## Bashr: bash in irb

As part of bootstrapping myself into ruby, I came up with some changes to
.irbrc that make it possible to send args to a bash command.

It was a mind-bending thing to think of a commandline app that was capable
of receiving args in an object-oriented kind of way.  But for me, it was a
step forward into ruby land.

Examples:
    >> cd ENV["HOME"]
    => nil
    >> pwd
    => "/home/sumsionjg"
    >> ls "-Al bashr"
    total 20
    drwxr-xr-x 7 sumsionjg sumsionjg  4096 2010-05-21 07:17 .git
    -rw-r--r-- 1 sumsionjg sumsionjg   661 2010-05-21 07:17 .irbrc
    => true

Weaknesses:

* no commands with '-' or '.' can be executed
* after a while, it's fairly annoying to try to craft command lines, however this annoyance drives me in a good way toward gems, so it's ok

Similar projects:

* http://rush.heroku.com/
* something else I don't remember
