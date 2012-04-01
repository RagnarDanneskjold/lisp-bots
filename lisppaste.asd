;;;; Silly emacs, this is -*- Lisp -*-
;;;; $Id: lisppaste.asd,v 1.26 2010-05-29 14:19:47 lisppaste Exp $
;;;; $Source: /project/lisppaste/cvsroot/lisppaste2/lisppaste.asd,v $

;;;; See the LICENSE file for licensing information.

(defsystem lisppaste
    :name "lisppaste"
    :author "Brian Mastenbrook"
    :version "2.4.0"
    :licence "MIT"
    :description "A pastebot written in Common Lisp"
    :long-description "lisppaste sits on a webserver and users can
paste text into it.  Once pasted, lisppaste will notify a
pre-configured IRC channel about the paste and where it can be
located."
    :depends-on (hunchentoot puri
                 #-lisppaste-no-irc cl-irc
                 split-sequence s-xml s-xml-rpc cl-ppcre
                 html-encode webutils split-sequence)
    :components ((:file "package")
		 (:file "utility" :depends-on ("package"))
                 (:file "variable"
                        :depends-on ("package" "utility"))
                 (:file "colorize-package")
                 (:file "coloring-css" :depends-on ("colorize-package"))
                 (:file "colorize" :depends-on ("colorize-package" "coloring-css"))
                 (:file "abbrev")
                 (:file "clhs-lookup" :depends-on ("abbrev"))
                 (:file "r5rs-lookup")
		 (:file "cocoa-lookup")
                 (:file "elisp-lookup")
                 #-lisppaste-no-irc (:file "irc-notification" :depends-on ("variable" "package"))
                 (:file "persistent-pastes"
                        :depends-on ("variable"
				     #-lisppaste-no-irc "irc-notification"))
                 (:file "lisppaste"
                        :depends-on ("variable" "clhs-lookup"
                                                "r5rs-lookup"
						"cocoa-lookup"
                                                "elisp-lookup"
                                                #-lisppaste-no-irc
                                                "irc-notification"
						"persistent-pastes"))
                 (:file "coloring-types"
                        :depends-on ("colorize" "clhs-lookup"))
		 (:file "ip-threshold"
			:depends-on ("lisppaste" "persistent-pastes"))
                 (:file "web-server"
                        :depends-on ("lisppaste"
                                     "colorize-package"
                                     "colorize"
                                     "coloring-css"
				     "persistent-pastes"
				     "ip-threshold"))
                 (:file "system-server"
                        :depends-on ("variable" "colorize-package"
                                                "coloring-css"))
                 (:file "xml-paste"
                        :depends-on ("variable" "lisppaste" "web-server" "ip-threshold"))
		 (:file "administration"
			:depends-on ("web-server" "variable"))))