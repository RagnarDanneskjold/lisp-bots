;;;; $Id: README.lisp,v 1.57 2010-07-30 21:33:57 lisppaste Exp $
;;;; $Source: /project/lisppaste/cvsroot/lisppaste2/README.lisp,v $

;;;; See the LICENSE file for licensing information.

;;; README for lisppaste:

;;; lisppaste requires a recent SBCL 0.8, araneida 0.80, and cl-irc
;;; 0.5. Once SBCL is installed, installing araneida and cl-irc is
;;; quite simple:
;;;
;;; (require :asdf) (require :asdf-install)
;;; (asdf-install:install :araneida)
;;; ; possibly selecting a restart to bypass GPG
;;; (asdf-install:install :cl-irc)
;;;
;;; lisppaste is pretty easy to get running.  First, edit the top few
;;; lines of variable.lisp and change *paste-site-name* and the
;;; internal and external ports to what's appropriate for your
;;; host. If you want to run it behind a proxying Apache
;;; (recommended), edit apache.conf.include and include that from your
;;; httpd.conf. Then, run SBCL and invoke the magical invocation as
;;; follows, or simply (load "README").

;;; If you wish to run without an IRC server, uncomment the following
;;; line:


(load (compile-file "redirect-handler"))

#+nil (s-xml-rpc:start-xml-rpc-server :port 8185)

;(lisppaste:start-lisppaste)

#-lisppaste-no-irc
;; (progn
;;   ;; To add a channel without restarting the IRC connection:
;;   ;;    (lisppaste:join-new-irc-channel "nick" "channel")
;;   (lisppaste:start-irc-notification
;;    :channels '(("#lisp" :common-lisp)
;; 	       ;; ("#scheme" :scheme)
;; 	       ;; ("#webkit" :webkit)
;; 	       ;; ("#lisppaste" :common-lisp)
;; 	       ;; "#fink"
;; 	       ;; "#oe"
;; 	       ;; "#opendarwin"
;; 	       ;; ("#macdev" :objective-c)
;; 	       ;; ("#iphonedev" :objective-c)
;; 	       ;; ("#ipaddev" :objective-c)
;; 	       ;; ("openemu" :objective-c)
;; 	       ;; ("#emacs" :elisp)
;; 	       ;; ("#racket" :scheme)
;; 	       ;; "#opennms"
;; 	       ;; "#evergreen"
;; 	       ;; ("#chicken" :scheme)
;; 	       ;; "#awk"
;; 	       ;; "#macports"
;; 	       ;; "#dylan"
;;                )
;;    :nickname "lisppaste"
;;    :server "chat.freenode.net"
;;    :port 6667)
;;   (sleep 5)
;;   ;; (lisppaste:start-irc-notification
;;   ;;  :channels '(("#guile" :scheme) ("#sbcl" :common-lisp))
;;   ;;  :nickname "lisppaste2"
;;   ;;  :server "chat.freenode.net")
;;   (sleep 5)
;;   #||
;;   (lisppaste:start-irc-notification
;;    :channels '("#pearpc" "#fpc" "#hprog" "#concatenative"
;; "#slate-users" "#swhack" "#ud" "#compilers" "#erights" "#esp"
;; ("#scsh" :scheme) ("#sisc" :scheme) ("#cocoa" :objective-c) "#darcs" "#hardcider" ("#lisp-it" :common-lisp)  "#publish" "#svg")
;;    :nickname "lisppaste2"
;;    :server "chat.freenode.net")
;;   (sleep 5)
;;   (lisppaste:start-irc-notification
;;    :channels '( "#launchd" "#darwinports" "#muse" "#chatkit" "#opensolaris" "#oscar-cluster" "#ledger" "#cairo" "#hug-bunny" "##parsers" "#perl6" "#ksvg" ("#rcirc" :elisp) "#code4lib" "#evergreen" ("#ucms" :python) "#tumbolia" ("#rlx" :common-lisp))
;;    :nickname "lisppaste3"
;;    :server "chat.freenode.net")
;;   (sleep 5)
;;   (lisppaste:start-irc-notification
;;    :channels '("#linux-quebec" "#programmering" "#maxima" "##concurrency" ("#paredit" :elisp) ("#erlang" :erlang) "#ucw" "#scummvm" ("#emacsfr" :elisp) ("#macsb" :objective-c) "#fedora-users" ("#sxemacs" :elisp) ("#guile" :scheme) "#dspam" "#svn-dev" "#math" "#photogeeks" "#conkeror" ("#ipaddev" :objective-c))
;;    :nickname "lisppaste4"
;;    :server "chat.freenode.net")
;;   (sleep 5)
;;   (lisppaste:start-irc-notification
;;    :channels '("#mutt" "#fr.openoffice.org" "#mercurial" ("#perian" :objective-c) ("#trac" :python) "#macosforge" "#erc" "#nars" ("#pylons" :python) ("#gnus" :elisp) "#macports" "#razmjenavjestina" ("#haskell.hr" :haskell) ("#schooltool" :python) "#adium-devl" "##wikipedia-geeks" "#wpmu" ("#reddit-dev" :python) ("#ccl" :common-lisp))
;;    :nickname "lisppaste5"
;;    :server "chat.freenode.net")
;;   (sleep 5)
;;   (lisppaste:start-irc-notification
;;    :channels '("#foresight" ("#stumpwm" :common-lisp) "#socialtext" ("#kde-mac" :objective-c) "#openils-evergreen" ("#lisp-pt" :common-lisp) "#squid" ("#zope" :python) ("#zwiki" :python) ("#lispcafe" :common-lisp) "#openmobl" ("#zope3-dev" :python) "#sophie-dev" "#scala" ("#eval" :scheme) ("#openemu" :objective-c) ("#giantrobot" :objective-c) ("#detroit-scheme" :scheme) ("#r7rs" :scheme))
;;    :nickname "lisppaste6"
;;    :server "chat.freenode.net")
;;   (lisppaste:start-irc-notification
;;    :channels '("#opennms" "#stepmania-devs" "#oe" "#gnu-smalltalk" "#akelos" ("#jsoftware" :scheme) "#phpeclipse" "#nu" "#kolab" "#lugola" ("#macosx" :objective-c) "#syx" "#owb" ("#webkit-gtk" :webkit) "#linkstationwiki" "#kawa" "#arc" "#talis" "#bitbucket")
;;    :nickname "lisppaste7"
;;    :server "chat.freenode.net")
;;   (lisppaste:start-irc-notification
;;    :channels '(("#halyard" :scheme) "#iphonedev" "#ccss" "#clojure" "#nerdgroup" "#seaside" "#foonas" "#nas-central" "#tech.coop" "#x264dev" "##bsd" ("##sandbox" :python) ("#lisps" :common-lisp) ("#green" :python) ("#macosxdev" :objective-c) ("#abcl" :common-lisp) "#myko" "#vufind" ("#libdispatch" :c))
;;    :nickname "lisppaste8"
;;    :server "chat.freenode.net")
;;   (lisppaste:start-irc-notification
;;    :channels '(("#grassyknoll" :python) "#chromium" ("#kismac" :objective-c) "#c-newbies" ("#squirrelfish" :webkit) "#NetBSD-code" "#diro" ("#melange" :python))
;;    :nickname "lisppaste9"
;;    :server "chat.freenode.net")
;; ||#
;; )